<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Attribute\Route;
use App\Repository\TournoiRepository;

class TournoisSQLStatController extends AbstractController
{
    #[Route('/statSql', name: 'app_stat_sql_tournoi')]
    public function indexSQL(Request $request, TournoiRepository $tournoiRepository): Response
    {
        $datemax = $request->query->get('datemax', '2025-01-01');

        $tournois = $tournoiRepository->findAllAfterThanDataSQL($datemax);

        $stats = [];
        foreach ($tournois as $t) {
            $categorieLibelle = $t['categorie_libelle'] ?? '(Aucune catégorie)';
            
            $dateFormatted = '(pas de date)';
            if (!empty($t['date'])) {
                try {
                    $date = new \DateTime($t['date']);
                    $dateFormatted = $date->format('d/m/Y H:i');
                } catch (\Exception $e) {
                    $dateFormatted = $t['date'];
                }
            }
            
            $stats[] = [
                'libelle' => $t['libelle'] ?? '(non défini)',
                'categorie' => $categorieLibelle,
                'date' => $dateFormatted,
            ];
        }

        return $this->render('tournoi_stat/sql.html.twig', [
            'stats' => $stats,
            'datemax' => $datemax,
            'mode' => 'SQL',
            'menuActif' => 'Tournois',
        ]);
    }
}