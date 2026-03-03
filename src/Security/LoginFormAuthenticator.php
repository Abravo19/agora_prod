<?php

namespace App\Security;

use App\Entity\LoginTrace;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Generator\UrlGeneratorInterface;
use Symfony\Component\Security\Core\Authentication\Token\TokenInterface;
use Symfony\Component\Security\Core\Exception\AuthenticationException;
use Symfony\Component\Security\Http\Authenticator\AbstractLoginFormAuthenticator;
use Symfony\Component\Security\Http\Authenticator\Passport\Badge\CsrfTokenBadge;
use Symfony\Component\Security\Http\Authenticator\Passport\Badge\RememberMeBadge;
use Symfony\Component\Security\Http\Authenticator\Passport\Badge\UserBadge;
use Symfony\Component\Security\Http\Authenticator\Passport\Credentials\PasswordCredentials;
use Symfony\Component\Security\Http\Authenticator\Passport\Passport;
use Symfony\Component\Security\Http\SecurityRequestAttributes;
use Symfony\Component\Security\Http\Util\TargetPathTrait;

class LoginFormAuthenticator extends AbstractLoginFormAuthenticator
{
    use TargetPathTrait;

    public const LOGIN_ROUTE = 'app_login';

    public function __construct(private UrlGeneratorInterface $urlGenerator, private EntityManagerInterface $entityManager)
    {
    }

    public function supports(Request $request): bool
    {
        return $request->isMethod('POST') && $request->attributes->get('_route') === self::LOGIN_ROUTE;
    }

    public function authenticate(Request $request): Passport
    {
        $username = $request->request->getString('username', '');

        $request->getSession()->set(SecurityRequestAttributes::LAST_USERNAME, $username);

        return new Passport(
            new UserBadge($username),
            new PasswordCredentials($request->request->getString('password', '')),
            [
                new CsrfTokenBadge('authenticate', $request->request->getString('_csrf_token', '')),
                new RememberMeBadge(),
            ]
        );
    }

    public function onAuthenticationSuccess(Request $request, TokenInterface $token, string $firewallName): ?Response
    {
        $this->logLoginAttempt($request, $token->getUser()->getUserIdentifier(), true, 'Connexion réussie');
        if ($targetPath = $this->getTargetPath($request->getSession(), $firewallName)) {
            return new RedirectResponse($targetPath);
        }

        // Redirection vers la page d'accueil après connexion réussie
        return new RedirectResponse($this->urlGenerator->generate('accueil'));
    }

    public function onAuthenticationFailure(Request $request, AuthenticationException $exception): Response
    {
        $username = $request->request->get('username', '');
        $this->logLoginAttempt($request, $username, false, substr($exception->getMessageKey(), 0, 25));

        $request->getSession()->set(SecurityRequestAttributes::AUTHENTICATION_ERROR, $exception);
        $request->getSession()->set(SecurityRequestAttributes::LAST_USERNAME, $username);

        return new RedirectResponse($this->urlGenerator->generate(self::LOGIN_ROUTE));
    }

    private function logLoginAttempt(Request $request, string $username, bool $success, ?string $message = null): void
    {
        $trace = new LoginTrace();
        $trace->setUsername($username);
        $trace->setIpAddress($request->getClientIp());
        $trace->setSuccess($success);
        $trace->setMessage($message !== null ? substr($message, 0, 25) : null);
        $trace->setLoggedAt(new \DateTimeImmutable());
        $this->entityManager->persist($trace);
        $this->entityManager->flush();
    }

    protected function getLoginUrl(Request $request): string
    {
        return $this->urlGenerator->generate(self::LOGIN_ROUTE);
    }
}
