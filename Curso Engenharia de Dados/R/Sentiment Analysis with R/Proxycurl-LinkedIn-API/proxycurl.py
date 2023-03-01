import asyncio
from proxycurl_py.asyncio import Proxycurl, do_bulk
import csv
import json
from time import sleep

proxycurl = Proxycurl(api_key='XAJGrELgWV5fPBxXIcVitg')
asyncio.set_event_loop_policy(asyncio.WindowsSelectorEventLoopPolicy())

balance_before_request = asyncio.run(proxycurl.get_balance())
print(f'Balance before request: {balance_before_request}')

with open('sample_file.json', 'r') as file:
    profiles = json.load(file)

urls = []
with open('urls.csv', 'r', encoding='utf-8') as file:
    reader = csv.reader(file)
    for row in reader:
        urls.append(row[0])
print(urls)

for url in urls:
    person = asyncio.run(proxycurl.linkedin.person.get(url= url,
                                                   skills= 'exclude',
                                                   use_cache= 'if-present',
                                                   inferred_salary= 'exclude',
                                                   extra= 'exclude'))

    profiles.append(person)
    sleep(5)

with open('contratados.json', 'w') as file:
    json.dump(profiles, file)

sleep(15)

balance_after_request = asyncio.run(proxycurl.get_balance())
print(f'Balance after request: {balance_after_request}')


'''
for url in urls:
    person = asyncio.run(proxycurl.linkedin.person.get(url='url',
                                                   skills= 'exclude',
                                                   use_cache= 'if-present',
                                                   inferred_salary= 'exclude',
                                                   extra= 'exclude'))

    profiles.append(person)


balance_before_request = asyncio.run(proxycurl.get_balance())
print(f'Balance before request: {balance_before_request}')

person = asyncio.run(proxycurl.linkedin.person.get(url='https://linkedin.com/in/aguinaldo-silva-7617a1b7',
                                                   skills= 'exclude',
                                                   use_cache= 'if-present',
                                                   inferred_salary= 'exclude',
                                                   extra= 'exclude'))

print(f'Person Result: {person}')

balance_after_request = asyncio.run(proxycurl.get_balance())
print(f'Balance after request: {balance_after_request}')

with open('sample_file.json', 'a') as file:
    json.dump(person, file)
'''