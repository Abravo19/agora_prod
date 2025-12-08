#!/bin/bash
# Script pour convertir index.html en PDF
# Utilise weasyprint ou wkhtmltopdf si disponible

HTML_FILE="index.html"
PDF_FILE="index.pdf"

if [ ! -f "$HTML_FILE" ]; then
    echo "❌ Fichier $HTML_FILE introuvable !"
    exit 1
fi

echo "🔄 Conversion de $HTML_FILE en $PDF_FILE..."

# Essayer avec weasyprint
if command -v weasyprint &> /dev/null; then
    echo "✅ Utilisation de weasyprint..."
    weasyprint "$HTML_FILE" "$PDF_FILE"
    if [ -f "$PDF_FILE" ]; then
        echo "✅ PDF créé avec succès : $PDF_FILE"
        exit 0
    fi
fi

# Essayer avec wkhtmltopdf
if command -v wkhtmltopdf &> /dev/null; then
    echo "✅ Utilisation de wkhtmltopdf..."
    wkhtmltopdf --page-size A4 --margin-top 0mm --margin-bottom 0mm --margin-left 0mm --margin-right 0mm "$HTML_FILE" "$PDF_FILE"
    if [ -f "$PDF_FILE" ]; then
        echo "✅ PDF créé avec succès : $PDF_FILE"
        exit 0
    fi
fi

# Si aucun outil n'est disponible, donner des instructions
echo ""
echo "❌ Aucun outil de conversion disponible."
echo ""
echo "Pour installer weasyprint (recommandé) :"
echo "  pip install weasyprint"
echo "  ou"
echo "  sudo pacman -S python-weasyprint"
echo ""
echo "Pour installer wkhtmltopdf :"
echo "  sudo pacman -S wkhtmltopdf-static"
echo ""
echo "Ensuite, relancez ce script ou exécutez :"
echo "  python3 html_to_pdf.py"
echo ""

exit 1



