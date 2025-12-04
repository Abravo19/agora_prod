<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use App\Repository\TournoiRepository;

class TournoisQBStatController extends AbstractController
{
    #[Route('/statQb', name: 'app_stat_qb_tournoi')]
    public function indexQB(Request $request, TournoiRepository $tournoiRepository): Response
    {
        // On récupère une date passée en GET ou on met une valeur par défaut
        $datemax = $request->query->get('datemax', '2025-01-01');

        // Appel à la méthode Query Builder du repository
        $tournois = $tournoiRepository->findAllAfterThanDateQB($datemax);

        // Transformation du résultat (objets Tournoi) en tableau exploitable pour la vue
        $stats = [];
        foreach ($tournois as $t) {
            $stats[] = [
                'libelle' => $t->getLibelle(),
                'categorie' => $t->getCategorie() ? $t->getCategorie()->getLibelle() : '(Aucune catégorie)',
                'date' => $t->getDate() ? $t->getDate()->format('d/m/Y H:i') : '(pas de date)',
            ];
        }

        return $this->render('tournoi_stat/sql.html.twig', [
            'stats' => $stats,
            'datemax' => $datemax,
            'mode' => 'Query Builder',
            'menuActif' => 'Tournois',
        ]);
    }
}


