import requests
import json
import os

adGuardUrl = 'https://raw.githubusercontent.com/blocklistproject/Lists/master/adguard/ads-ags.txt'
outputFilename = 'converse.json'


def convert_adguard_to_declarative_net_request(line, id):
    url_filter = line.replace('||', '*://*.').replace('^', '/*')
    resource_types = ['script', 'image', 'sub_frame']
    return {
        'id': id,
        'priority': id,
        'action': {
            'type': 'block'
        },
        'condition': {
            'url_filter': url_filter,
            'resource_types': resource_types
        }
    }


def convert_adguard_file_to_declarative_net_request_file(url, filename):
    try:
        response = requests.get(url)
        text = response.text

        lines = [line for line in text.split('\n') if not line.startswith('!') and not line.startswith('[')]

        id = 1
        rules = []
        for line in lines:
            rule = convert_adguard_to_declarative_net_request(line, id)

            rules.append(rule)

            id += 1

        jsonf = json.dumps(rules)

        with open(filename, 'w') as f:
            f.write(jsonf)

        print(f'Successfully converted {url} to {filename}')


    except Exception as err:

        print(err)


convert_adguard_file_to_declarative_net_request_file(adGuardUrl, outputFilename)
