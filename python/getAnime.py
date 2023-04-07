import requests
from bs4 import BeautifulSoup
import cloudscraper

scraper = cloudscraper.create_scraper(delay=10,   browser={'custom': 'ScraperBot/1.0',})
url_inicio = 'https://www3.animeflv.net/ver/fairy-tail-'
fin = 176

for i in range(fin):
    new_url = f"{url_inicio}{i}"
    req = scraper.get(new_url)
    soup = BeautifulSoup(req.text, "html.parser")
    for a in soup.find_all('a', href=True):
        if "mega.nz" in a['href']:
            print(f"{i} {a['href']}")

