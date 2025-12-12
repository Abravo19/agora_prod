<?php

namespace App\Controller\Admin;

use EasyCorp\Bundle\EasyAdminBundle\Attribute\AdminDashboard;
use EasyCorp\Bundle\EasyAdminBundle\Config\Dashboard;
use EasyCorp\Bundle\EasyAdminBundle\Config\MenuItem;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractDashboardController;
use EasyCorp\Bundle\EasyAdminBundle\Router\AdminUrlGenerator;
use Symfony\Component\HttpFoundation\Response;
use App\Controller\Admin\JeuVideoCrudController;
use App\Entity\JeuVideo;
use App\Entity\Genre;
use App\Entity\Plateforme;
use App\Entity\Marque;
use App\Entity\Pegi;
use App\Entity\Tournoi;
use App\Entity\CatTournois;
use App\Entity\Participant;
use App\Entity\Membre;
use App\Repository\JeuVideoRepository;
use App\Repository\GenreRepository;
use App\Repository\PlateformeRepository;
use App\Repository\MarqueRepository;
use App\Repository\TournoiRepository;
use App\Repository\CatTournoisRepository;
use App\Repository\ParticipantRepository;
use App\Repository\MembreRepository;

#[AdminDashboard(routePath: '/admin', routeName: 'admin')]
class DashboardController extends AbstractDashboardController
{
    public function __construct(
        private JeuVideoRepository $jeuVideoRepository,
        private GenreRepository $genreRepository,
        private PlateformeRepository $plateformeRepository,
        private MarqueRepository $marqueRepository,
        private TournoiRepository $tournoiRepository,
        private CatTournoisRepository $catTournoisRepository,
        private ParticipantRepository $participantRepository,
        private MembreRepository $membreRepository,
    ) {}

    public function index(): Response
    {
        // Récupère les statistiques
        $stats = [
            'jeux' => $this->jeuVideoRepository->count([]),
            'genres' => $this->genreRepository->count([]),
            'plateformes' => $this->plateformeRepository->count([]),
            'marques' => $this->marqueRepository->count([]),
            'tournois' => $this->tournoiRepository->count([]),
            'categories' => $this->catTournoisRepository->count([]),
            'participants' => $this->participantRepository->count([]),
            'membres' => $this->membreRepository->count([]),
        ];

        return $this->render('admin/dashboard.html.twig', [
            'stats' => $stats,
        ]);
    }

    public function configureDashboard(): Dashboard
    {
        return Dashboard::new()
            ->setTitle('Agora');
    }

    public function configureMenuItems(): iterable
    {
        yield MenuItem::linkToDashboard('Dashboard', 'fa fa-home');
        yield MenuItem::linkToCrud('Jeux Video', 'fas fa-gamepad', JeuVideo::class);
        yield MenuItem::linkToCrud('Genres', 'fas fa-list', Genre::class);
        yield MenuItem::linkToCrud('Plateformes', 'fas fa-list', Plateforme::class);
        yield MenuItem::linkToCrud('Marques', 'fas fa-list', Marque::class);
        yield MenuItem::linkToCrud('PEGI', 'fas fa-list', Pegi::class);
        yield MenuItem::linkToCrud('Tournois', 'fas fa-list', Tournoi::class);
        yield MenuItem::linkToCrud('CatTournois', 'fas fa-list', CatTournois::class);
        yield MenuItem::linkToCrud('Participants', 'fas fa-list', Participant::class);
        yield MenuItem::linkToCrud('Membre', 'fas fa-list', Membre::class);
        // yield MenuItem::linkToCrud('The Label', 'fas fa-list', EntityClass::class);
    }
}
