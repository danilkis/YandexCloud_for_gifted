import unittest
import main

class EmailAndNicknameValidationTestCase(unittest.TestCase):
    def test_is_valid_nickname(self):
        valid_nicknames = [
            "abc123",
            "nickname_123",
            "a_b-c-1_2-3",
            "nickname-123",
            "NICKNAME_123",
            "aBc-123",
            "nickname-_-123",
            "nickname-123_abc",
        ]

        invalid_nicknames = [
            "a",
            "ab",
            "aaaaaaaaaaaaaaaaaaa",
            "nickname$123",
            "nickname!@#",
            "nickname+=",
            "nickname\/n",
            "nickname\t",
            "nickname\n\r\t",
        ]

        for nickname in valid_nicknames:
            self.assertTrue(main.is_valid_nickname(nickname))

        for nickname in invalid_nicknames:
            self.assertFalse(main.is_valid_nickname(nickname))

    def test_is_valid_email(self):
        valid_emails = [
            "test@example.com",
            "user.name@example.com",
            "user123@example.co.uk",
            "user.name@example-mail.com",
            "user123@example-mail.co.uk",
            "user_123@example.com",
            "user-name@example.com",
            "user123@examplemail123.com",
            "user.name_123@example.com",
            "user.name@example123.com",
        ]

        invalid_emails = [
            "",
            "test@",
            "@example.com",
            "test@example",
            "test@example..com",
            "test@.com",
            "test@example_com",
            "test@example!com",
            "test example@example.com",
            "test\n@example.com",
            "test\t@example.com",
        ]

        for email in valid_emails:
            self.assertTrue(main.is_valid_email(email))

        for email in invalid_emails:
            self.assertFalse(main.is_valid_email(email))

if __name__ == '__main__':
    unittest.main()