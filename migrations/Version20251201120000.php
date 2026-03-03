<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Migration pour la table login_trace
 */
final class Version20251201120000 extends AbstractMigration
{
    public function getDescription(): string
    {
        return 'Création de la table login_trace';
    }

    public function up(Schema $schema): void
    {
        $this->addSql('CREATE TABLE login_trace (
            id INT AUTO_INCREMENT NOT NULL,
            username VARCHAR(180) NOT NULL,
            ip_address VARCHAR(45) DEFAULT NULL,
            success TINYINT(1) NOT NULL,
            message VARCHAR(25) DEFAULT NULL,
            logged_at DATETIME NOT NULL COMMENT \'(DC2Type:datetime_immutable)\',
            PRIMARY KEY(id)
        ) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
    }

    public function down(Schema $schema): void
    {
        $this->addSql('DROP TABLE login_trace');
    }
}
