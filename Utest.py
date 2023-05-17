import form
import unittest
class EmailValidationTestCase(unittest.TestCase):
    def setUp(self):
        # Примеры неверных email
        self.list_mail_uncor = [
            "", "1", "m1@", "@mail", "example.com", "test@.com",
            "test@mail.c", "test@@mail.com", "test@mail..com",
            "test.@mail.com", "test@mail_com", "test@mail+com"
        ]

        # Примеры верных email
        self.list_mail_cor = [
            "m.m@mail.ru", "m1@gmail.com", "john.doe@example.com",
            "info@company.co.uk", "name.lastname@example.co.jp"
        ]

    def test_invalid_emails(self):
        for email in self.list_mail_uncor:
            with self.subTest(email=email):
                self.assertFalse(form.is_valid_email(email))

    def test_valid_emails(self):
        for email in self.list_mail_cor:
            with self.subTest(email=email):
                self.assertTrue(form.is_valid_email(email))

if __name__ == '__main__':
    unittest.main()