# def __init__(self, , )
# def check_card_length(card_length):
# print("******************************")
from typing import Tuple, Set


# card = input("Kindly Enter your card details to verify: ")
# print("Credit Card Number: " + card)


def check_card_length(card: list):
    if 13 <= len(card) <= 16:
        return f"The length of the card is, {len(card)}"
    else:
        return "Credit card length: Invalid Card Length "


print(check_card_length(card=[2, 3, 4, 1, 5, 6, 3, 8, 9, 2, 3, 8, 3, 9]))


def check_card_type(card: list):
    # for index in card:
    if card[0] == 4:
        return f"This is a Visa Card"
    elif card[0] == 5:
        return f"This is a Master Card"
    elif card[0] == 3 and 7:
        return f"This an American Express Card"
    elif card[0] == 6:
        return f"This is a Discover Card"
    return f"This Card type is not recognised"


print(check_card_type(card=[2, 3, 4, 1, 5, 6, 3, 8, 9, 2, 3, 8, 3, 9]))

card = [2, 3, 4, 1, 5, 6, 3, 8, 9, 2, 3, 8, 3, 9]
print(card)


def check_for_even_numbers(cad: list):
    numbs = cad[::-1]
    numb = numbs[::-2]
    # print(numbs)
    # print(numb)
    value = [b if b <= 9 else b // 10 + b % 10 for b in [x * 2 for x in numb]]
    return value


def add_even_numbers(cad: list) -> int:
    result = 0
    for index in cad:
        result += index
    return result


print(add_even_numbers(cad=check_for_even_numbers([2, 3, 4, 1, 5, 6, 3, 8, 9, 2, 3, 8, 3, 9])))

print(check_for_even_numbers(cad=card))


def add_odd_numbers(card: list):
    numbs = card[::-1]
    numb = numbs[::-2]

    print(numbs)
# sum_from_step2_and_3(card)
# print([sum_digit])
# print(card)

# multiply_card_no = card[i] * 2
# print(multiply_card_no)
# first_number_2 = sum_odd_digit // 10
# second_number_2 = sum_odd_digit % 10
# new_number_2 = first_number_2 + second_number_2
# print(sum_odd_digit)
