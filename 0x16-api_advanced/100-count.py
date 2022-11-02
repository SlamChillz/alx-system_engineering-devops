#!/usr/bin/python3
"""
Defines a function that queries Reddit API
"""
import requests


def count_words(subreddit, word_list, after=None, worddict={}, ctr=0):
    """
    Queries Reddit API, parses the title of all hot articles, and
    prints a sorted count of given keywords (case-insensitive, delimited
    by spaces. Javascript should count as javascript, but java should not)
    Args:
        subreddit (str): name of a subreddit
        word_list (list): lit of words to search for
        after (str): last item in the api listing
        worddict (dict)
    Return:
        titles (list): a list of hot subreddit titles
        None: if subreddit is not valid
    """
    url = "https://reddit.com/r/" + subreddit + \
        "/hot.json?limit=100&after={}".format(after)
    headers = {'User-Agent': 'Mozilla/5.0'}
    post = requests.get(url=url, headers=headers, allow_redirects=False)
    tpost = requests.get(
        url=post.headers['Location'], headers=headers, allow_redirects=False)
    if tpost.status_code != 200:
        return None
    else:
        if ctr == 0:
            for word in word_list:
                worddict[word] = 0

        tposts = tpost.json()['data']['children']
        for toppost in tposts:
            for word in word_list:
                worddict[word] += toppost['data']['title'].lower().split(
                ).count(word.lower())
        aft = tpost.json()['data']['after']
        if aft is not None:
            count_words(subreddit, word_list, aft, worddict, ctr + 1)
        else:
            if all(v == 0 for v in worddict.values()) or len(worddict) == 0:
                print("")
                return
            multidict = {k.lower(): 0 for k, v in worddict.items()}
            for k, v in multidict.items():
                for key, val in worddict.items():
                    if key.lower() == k:
                        multidict[k] += val
            newmmultidict = {k: v for k, v in sorted(
                multidict.items(), key=lambda x: (-x[1], x[0]))}
            for i, j in newmmultidict.items():
                if j != 0:
                    print('{}: {}'.format(i, j))
            return
    return
