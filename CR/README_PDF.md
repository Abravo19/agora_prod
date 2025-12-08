# Conversion HTML vers PDF

Ce dossier contient des scripts pour convertir `index.html` en PDF.

## Méthodes disponibles

### Option 1 : Utiliser weasyprint (recommandé)

**Installation :**
```bash
# Avec pip (si disponible)
pip install weasyprint

# Ou sur Arch Linux avec pacman
sudo pacman -S python-weasyprint
```

**Utilisation :**
```bash
python3 html_to_pdf.py
```

### Option 2 : Utiliser wkhtmltopdf

**Installation :**
```bash
# Sur Arch Linux
sudo pacman -S wkhtmltopdf-static
```

**Utilisation :**
```bash
python3 html_to_pdf.py
# ou
./convert_to_pdf.sh
```

### Option 3 : Utiliser le navigateur (manuel)

1. Ouvrez `index.html` dans votre navigateur
2. Utilisez la fonction "Imprimer" (Ctrl+P)
3. Choisissez "Enregistrer en PDF" comme destination
4. Configurez les marges à 0mm pour un rendu optimal

## Scripts disponibles

- `html_to_pdf.py` : Script Python qui essaie automatiquement différentes méthodes
- `convert_to_pdf.sh` : Script bash alternatif

## Note

Les scripts essaieront automatiquement les outils disponibles dans cet ordre :
1. weasyprint
2. Firefox (mode headless)
3. wkhtmltopdf

Si aucun outil n'est disponible, les scripts afficheront les instructions d'installation.



