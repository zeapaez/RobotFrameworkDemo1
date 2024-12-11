from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn

@library
class ShopLibrary1():
    def __init__(self):
        self.seleniumLib = BuiltIn().get_library_instance("SeleniumLibrary")

    @keyword
    def hello_world(self):
        print("Hello")

    @keyword
    def add_items_to_cart_and_checkout(self, expectedList):
        print(expectedList)
        #${WebElements}    Get Webelements    css:.card-body .card-title a
        i = 1
        productsNames = self.seleniumLib.get_webelements("css:.card-body .card-title a")
        for productsName in productsNames:
            if productsName.text in expectedList:
                self.seleniumLib.click_button("xpath:(//*[@class='card-footer'])["+str(i)+"]/button")
            i = i + 1

    @keyword
    def remove_items_from_cart(self, expectedList):
        print(expectedList)
        productsNames = self.seleniumLib.get_webelements("//table/tbody/tr//h4/a")
        for productsName in productsNames:
            if productsName.text in expectedList:
                self.seleniumLib.click_button("//*[text()='"+productsName.text+"']//ancestor::tr//button")

    @keyword
    def click_link_lib(self):
        self.seleniumLib.click_link("css:li.active a")