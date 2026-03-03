<?php

namespace App\Form;

use App\Entity\Membre;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class MembreType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('username')
            ->add('roles', ChoiceType::class, [
                'choices' => [
                    'Utilisateur' => 'ROLE_USER',
                    'Administrateur' => 'ROLE_ADMIN',
                ],
                'expanded' => true,
                'multiple' => true,
                'label' => 'Rôles',
            ])
            ->add('password', PasswordType::class, [
                'mapped' => false,
                'required' => !$options['is_edit'],
                'label' => 'Mot de passe',
                'attr' => ['autocomplete' => 'new-password'],
            ])
            ->add('nomMembre')
            ->add('prenomMembre')
            ->add('mailMembre')
            ->add('telMembre')
            ->add('rueMembre')
            ->add('cpMembre')
            ->add('villeMembre')
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Membre::class,
            'is_edit' => false,
        ]);
    }
}
