import unittest
import num1_1

class ProjectTest(unittest.TestCase):
    def test_product(self):
        self.assertTrue(num1_1.testTestTrue())

    def test_array_product(self):
        self.assertTrue(num1_1.array_prod1([1,2,3,4], 2)  == 8)

    def test_array_product_no_divis(self):
        self.assertTrue(num1_1.array_prod2([1,2,3,4], 3) == 6)

if __name__ == '__main__':
    unittest.main()
