#!/usr/bin/env python3
"""
Script pour convertir index.html en PDF
Utilise weasyprint si disponible, sinon donne des instructions
"""

import sys
import os
import subprocess

def convert_with_weasyprint(html_file, pdf_file):
    """Convertit HTML en PDF avec weasyprint"""
    try:
        from weasyprint import HTML
        HTML(filename=html_file).write_pdf(pdf_file)
        print(f"✅ PDF créé avec succès : {pdf_file}")
        return True
    except ImportError:
        print("❌ weasyprint n'est pas installé.")
        print("\nPour l'installer, exécutez :")
        print("  pip install weasyprint")
        print("\nOu sur Arch Linux :")
        print("  sudo pacman -S python-weasyprint")
        return False
    except Exception as e:
        print(f"❌ Erreur lors de la conversion : {e}")
        return False

def convert_with_firefox(html_file, pdf_file):
    """Convertit HTML en PDF avec Firefox en mode headless"""
    try:
        # Convertir le chemin relatif en chemin absolu
        abs_html = os.path.abspath(html_file)
        abs_pdf = os.path.abspath(pdf_file)
        
        # Utiliser file:// pour le protocole local
        file_url = f"file://{abs_html}"
        
        # Vérifier que le fichier HTML existe
        if not os.path.exists(abs_html):
            print(f"❌ Fichier HTML introuvable : {abs_html}")
            return False
        
        print(f"   📄 HTML : {abs_html}")
        print(f"   📄 PDF : {abs_pdf}")
        print(f"   🌐 URL : {file_url}")
        
        # Créer un profil temporaire pour éviter les conflits
        import tempfile
        temp_profile = tempfile.mkdtemp(prefix='firefox-pdf-')
        
        # Essayer avec Firefox headless avec un profil temporaire
        result = subprocess.run(
            ['firefox', '--headless', '--profile', temp_profile, 
             '--print-to-pdf', abs_pdf, file_url],
            capture_output=True,
            text=True,
            timeout=30
        )
        
        # Nettoyer le profil temporaire
        import shutil
        try:
            shutil.rmtree(temp_profile)
        except:
            pass
        
        # Attendre un peu pour que le fichier soit créé
        import time
        time.sleep(2)
        
        if os.path.exists(abs_pdf):
            print(f"✅ PDF créé avec succès : {pdf_file}")
            return True
        else:
            print(f"❌ Le fichier PDF n'a pas été créé")
            if result.stderr:
                print(f"   Erreur : {result.stderr}")
            if result.stdout:
                print(f"   Sortie : {result.stdout}")
            return False
    except FileNotFoundError:
        return False
    except subprocess.TimeoutExpired:
        print("❌ Timeout lors de la conversion avec Firefox")
        return False
    except Exception as e:
        print(f"❌ Erreur avec Firefox : {e}")
        return False

def convert_with_wkhtmltopdf(html_file, pdf_file):
    """Convertit HTML en PDF avec wkhtmltopdf"""
    try:
        result = subprocess.run(
            ['wkhtmltopdf', '--page-size', 'A4', '--margin-top', '0mm', 
             '--margin-bottom', '0mm', '--margin-left', '0mm', '--margin-right', '0mm',
             html_file, pdf_file],
            capture_output=True,
            text=True
        )
        if result.returncode == 0:
            print(f"✅ PDF créé avec succès : {pdf_file}")
            return True
        else:
            print(f"❌ Erreur wkhtmltopdf : {result.stderr}")
            return False
    except FileNotFoundError:
        return False

def main():
    html_file = 'index.html'
    pdf_file = 'index.pdf'
    
    if not os.path.exists(html_file):
        print(f"❌ Fichier {html_file} introuvable !")
        sys.exit(1)
    
    print(f"🔄 Conversion de {html_file} en {pdf_file}...")
    
    # Essayer d'abord avec weasyprint
    if convert_with_weasyprint(html_file, pdf_file):
        return
    
    # Essayer avec Firefox
    print("🔄 Tentative avec Firefox...")
    if convert_with_firefox(html_file, pdf_file):
        return
    
    # Sinon essayer avec wkhtmltopdf
    if convert_with_wkhtmltopdf(html_file, pdf_file):
        return
    
    print("\n❌ Aucun outil de conversion disponible.")
    print("\nOptions d'installation :")
    print("1. weasyprint (recommandé) : pip install weasyprint")
    print("2. wkhtmltopdf : sudo pacman -S wkhtmltopdf-static")
    sys.exit(1)

if __name__ == '__main__':
    main()

