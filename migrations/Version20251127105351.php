<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20251127105351 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE participant (id INT AUTO_INCREMENT NOT NULL, prenom VARCHAR(50) NOT NULL, nom VARCHAR(50) NOT NULL, telephone VARCHAR(14) NOT NULL, email VARCHAR(100) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE tournoi_participant (tournoi_id INT NOT NULL, participant_id INT NOT NULL, INDEX IDX_9C531479F607770A (tournoi_id), INDEX IDX_9C5314799D1C3019 (participant_id), PRIMARY KEY(tournoi_id, participant_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE tournoi_participant ADD CONSTRAINT FK_9C531479F607770A FOREIGN KEY (tournoi_id) REFERENCES tournoi (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE tournoi_participant ADD CONSTRAINT FK_9C5314799D1C3019 FOREIGN KEY (participant_id) REFERENCES participant (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE jeu_video ADD plateforme_id INT DEFAULT NULL, ADD pegi_id INT DEFAULT NULL, ADD genre_id INT DEFAULT NULL, ADD marque_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE jeu_video ADD CONSTRAINT FK_4E22D9D4391E226B FOREIGN KEY (plateforme_id) REFERENCES plateforme (id)');
        $this->addSql('ALTER TABLE jeu_video ADD CONSTRAINT FK_4E22D9D4DD019E4A FOREIGN KEY (pegi_id) REFERENCES pegi (id)');
        $this->addSql('ALTER TABLE jeu_video ADD CONSTRAINT FK_4E22D9D44296D31F FOREIGN KEY (genre_id) REFERENCES genre (id)');
        $this->addSql('ALTER TABLE jeu_video ADD CONSTRAINT FK_4E22D9D44827B9B2 FOREIGN KEY (marque_id) REFERENCES marque (id)');
        $this->addSql('CREATE INDEX IDX_4E22D9D4391E226B ON jeu_video (plateforme_id)');
        $this->addSql('CREATE INDEX IDX_4E22D9D4DD019E4A ON jeu_video (pegi_id)');
        $this->addSql('CREATE INDEX IDX_4E22D9D44296D31F ON jeu_video (genre_id)');
        $this->addSql('CREATE INDEX IDX_4E22D9D44827B9B2 ON jeu_video (marque_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE tournoi_participant DROP FOREIGN KEY FK_9C531479F607770A');
        $this->addSql('ALTER TABLE tournoi_participant DROP FOREIGN KEY FK_9C5314799D1C3019');
        $this->addSql('DROP TABLE participant');
        $this->addSql('DROP TABLE tournoi_participant');
        $this->addSql('ALTER TABLE jeu_video DROP FOREIGN KEY FK_4E22D9D4391E226B');
        $this->addSql('ALTER TABLE jeu_video DROP FOREIGN KEY FK_4E22D9D4DD019E4A');
        $this->addSql('ALTER TABLE jeu_video DROP FOREIGN KEY FK_4E22D9D44296D31F');
        $this->addSql('ALTER TABLE jeu_video DROP FOREIGN KEY FK_4E22D9D44827B9B2');
        $this->addSql('DROP INDEX IDX_4E22D9D4391E226B ON jeu_video');
        $this->addSql('DROP INDEX IDX_4E22D9D4DD019E4A ON jeu_video');
        $this->addSql('DROP INDEX IDX_4E22D9D44296D31F ON jeu_video');
        $this->addSql('DROP INDEX IDX_4E22D9D44827B9B2 ON jeu_video');
        $this->addSql('ALTER TABLE jeu_video DROP plateforme_id, DROP pegi_id, DROP genre_id, DROP marque_id');
    }
}
