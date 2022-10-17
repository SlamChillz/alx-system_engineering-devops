#!/usr/bin/python3
"""
Python script that, using the JSON PLACEHOLDER API,
for a given employee ID, returns information about his/her TODO list progress
"""
import requests
import sys


def get_data_from_api(eid):
    """
    Gets and prints data from JSON PLACEHOLDER API
    Args:
        eid: employee id
    Return:
        None
    """
    base = "https://jsonplaceholder.typicode.com/"
    user = requests.get(base + "users/" + eid).json()
    userTodos = requests.get(base + "todos", params={"userId": eid}).json()
    completed = [_.get("title") for _ in userTodos if _.get("completed")]
    output = "Employee {} is done with tasks({}/{}):".format(
        user.get("name"), len(completed), len(userTodos))
    print("\n\t ".join([output] + completed))


if __name__ == "__main__":
    get_data_from_api(sys.argv[1])
