<?php

namespace App\Controller;

use App\Repository\TournoiRepository;
use App\Repository\CatTournoisRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class TournoiStatController extends AbstractController
{
    #[Route('/statTournoi', name: 'app_stat_tournoi_index')]
    public function index(Request $request, TournoiRepository $tournoiRepository, CatTournoisRepository $categorieRepository): Response
    {
        $categorieId = $request->query->get('categorie');

        if ($categorieId) {
            $tournois = $tournoiRepository->findBy(['categorie' => $categorieId]);
        } else {
            $tournois = $tournoiRepository->findAll();
        }

        $stats = [];
        foreach ($tournois as $t) {
            $stats[] = [
                'libelle' => $t->getLibelle(),
                'categorie' => $t->getCategorie() ? $t->getCategorie()->getLibelle() : '(Aucune catégorie)',
                'nbParticipants' => count($t->getParticipants()),
            ];
        }

        $categories = $categorieRepository->findAll();

        return $this->render('tournoi_stat/index.html.twig', [
            'stats' => $stats,
            'categorie' => $categories,
            'selectedCategorie' => $categorieId,
            'menuActif' => 'Tournois',
        ]);
    }
}
