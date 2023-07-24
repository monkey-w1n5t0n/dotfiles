#!/usr/bin/env python3

from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.support import expected_conditions
from selenium.webdriver.support.wait import WebDriverWait
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities

class EventListener(object):
    def before_click(self, element, driver):
        print(f'About to click on: {element}')

    def after_click(self, element, driver):
        print(f'Clicked on: {element}')

class EventFiringWebDriver(webdriver.Firefox):
    def __init__(self, *args, **kwargs):
        super(EventFiringWebDriver, self).__init__(*args, **kwargs)
        self._event_listener = EventListener()

    def click(self, *args, **kwargs):
        self._event_listener.before_click(self, None)
        super(EventFiringWebDriver, self).click(*args, **kwargs)
        self._event_listener.after_click(self, None)

links_downloaded = 2

# List of links
links = [
    # "https://filecat.net/f/yYo1e4/Trilian.1.6.Lib.part01.rar",
    # "https://filecat.net/f/lqenhd/Trilian.1.6.Lib.part02.rar",
    "https://filecat.net/f/q5wxLG/Trilian.1.6.Lib.part03.rar",
    "https://filecat.net/f/XgN8BG/Trilian.1.6.Lib.part04.rar",
    "https://filecat.net/f/c8Msky/Trilian.1.6.Lib.part05.rar",
    "https://filecat.net/f/hooN2q/Trilian.1.6.Lib.part06.rar",
    "https://filecat.net/f/LSnjl5/Trilian.1.6.Lib.part07.rar",
    "https://filecat.net/f/nuEd6j/Trilian.1.6.Lib.part08.rar",
    "https://filecat.net/f/vzbxBA/Trilian.1.6.Lib.part09.rar",
    "https://filecat.net/f/m2nZin/Trilian.1.6.Lib.part10.rar",
    "https://filecat.net/f/qrwjDm/Trilian.1.6.Lib.part11.rar",
    "https://filecat.net/f/p322xe/Trilian.1.6.Lib.part12.rar",
    "https://filecat.net/f/w7Le2d/Trilian.1.6.Lib.part13.rar",
    "https://filecat.net/f/fF3t1s/Trilian.1.6.Lib.part14.rar",
    "https://filecat.net/f/wf6ttl/Trilian.1.6.Lib.part15.rar",
    "https://filecat.net/f/rjzciz/Trilian.1.6.Lib.part16.rar",
    "https://filecat.net/f/u27Dsg/Trilian.1.6.Lib.part17.rar",
    "https://filecat.net/f/eg3HsH/Trilian.1.6.Lib.part18.rar",
    "https://filecat.net/f/kEc2Az/Trilian.1.6.Lib.part19.rar",
    "https://filecat.net/f/ui4pF5/Trilian.1.6.Lib.part20.rar",
    "https://filecat.net/f/shT5XT/Trilian.1.6.Lib.part21.rar",
    "https://filecat.net/f/zKklk1/Trilian.1.6.Lib.part22.rar",
    "https://filecat.net/f/ygao7m/Trilian.1.6.Lib.part23.rar",
    "https://filecat.net/f/dLoY2k/Trilian.1.6.Lib.part24.rar",
    "https://filecat.net/f/pAjC5o/Trilian.1.6.Lib.part25.rar",
    "https://filecat.net/f/thWFvm/Trilian.1.6.Lib.part26.rar",
    "https://filecat.net/f/bKUQ8W/Trilian.1.6.Lib.part27.rar",
    "https://filecat.net/f/FsdI2j/Trilian.1.6.Lib.part28.rar",
    "https://filecat.net/f/ynk7xV/Trilian.1.6.Lib.part29.rar",
    "https://filecat.net/f/7ihifC/Trilian.1.6.Lib.part30.rar",
    "https://filecat.net/f/hySV7h/Trilian.1.6.Lib.part31.rar",
    "https://filecat.net/f/yue05a/Trilian.1.6.Lib.part32.rar",
    "https://filecat.net/f/hEDj68/Trilian.1.6.Lib.part33.rar",
    "https://filecat.net/f/i2jsbb/Trilian.1.6.Lib.part34.rar",
    "https://filecat.net/f/xnNxkm/Trilian.1.6.Lib.part35.rar"
]

# Open a browser window
driver = EventFiringWebDriver()

# Visit the website anydebrid.com
driver.get("https://anydebrid.com")



# Perform your actions here
# For example, to click on a button:
# button = driver.find_element(By.ID, 'button-id')
# button.click()


for i in range(len(links)):
    link_textbox = driver.find_element(By.ID, 'links')
    get_button = driver.find_element(By.ID, 'generate_prem_links')
    # Click on the text box
    link_textbox.click()

    # Paste the first link in the text box
    link_textbox.send_keys(links[0])

    get_button.click()
    input('Press ENTER to exit')
