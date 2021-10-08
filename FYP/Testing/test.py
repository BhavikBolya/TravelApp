from selenium import webdriver
from bs4 import BeautifulSoup
import re
import time

driver = webdriver.Chrome()

url = "https://www.tripadvisor.in/Hotels-g293860-India-Hotels.html"
driver.get(url)

time.sleep(10)
soup = BeautifulSoup(driver.page_source, 'html.parser')
driver.quit()

filename = 'tripadvisor_canada_hotels'+ str(90) + '.txt'

with open(filename, mode='w', encoding = 'utf8') as file:
        file.write(str(soup))

print('TripAdvisor- hotel HTML page downloaded successfully..')