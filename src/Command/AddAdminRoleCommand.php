<?php

namespace App\Command;

use App\Repository\MembreRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Console\Attribute\AsCommand;
use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\Console\Style\SymfonyStyle;

#[AsCommand(
    name: 'app:add-admin-role',
    description: 'Ajoute ROLE_ADMIN au membre admin',
)]
class AddAdminRoleCommand extends Command
{
    public function __construct(
        private MembreRepository $membreRepository,
        private EntityManagerInterface $entityManager,
    ) {
        parent::__construct();
    }

    protected function execute(InputInterface $input, OutputInterface $output): int
    {
        $io = new SymfonyStyle($input, $output);

        $admin = $this->membreRepository->findOneBy(['username' => 'admin']);
        if (!$admin) {
            $io->error('Aucun membre avec le username "admin" trouvé.');
            return Command::FAILURE;
        }

        $roles = $admin->getRoles();
        if (!in_array('ROLE_ADMIN', $roles, true)) {
            $admin->setRoles(array_unique([...$roles, 'ROLE_ADMIN']));
            $this->entityManager->flush();
            $io->success('ROLE_ADMIN ajouté à l\'utilisateur admin.');
        } else {
            $io->info('L\'utilisateur admin possède déjà ROLE_ADMIN.');
        }

        return Command::SUCCESS;
    }
}
