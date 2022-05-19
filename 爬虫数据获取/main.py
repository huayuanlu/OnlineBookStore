import requests  # 1. 导入requests 库
import parsel
import csv
import re

f = open('书籍信息.csv', mode='a', encoding='UTF-8', newline='')
csv_Writer = csv.DictWriter(f, fieldnames=[
    '编号',
    '书名',
    '作者',
    '价格',
    '出版社',
    '链接',
])
id = 0
for page in range(1, 26):
    url = f'http://bang.dangdang.com/books/bestsellers/01.00.00.00.00.00-recent7-0-0-1-{page}'  # 2. 设置网页的URL地址
    content_page = requests.get(url).text  # 3. 执行页面请求，返回页面内容
    selectors = parsel.Selector(content_page)
    lis = (selectors.css('ul.bang_list li'))
    for li in lis:
        id += 1;
        name = li.css('.name a::attr(title)').get()
        author = li.css('.publisher_info a::text').get()
        publisher = li.css('div:nth-child(6) a::text').get()
        Price = li.css('.price p .price_n::text').get().replace('¥', '')
        href = li.css('.name a::attr(href)').get()
        dit = {
            '编号': id,
            '书名': name,
            '作者': author,
            '价格': Price,
            '出版社': publisher,
            '链接': href
        }
        print(id, name, author, publisher, Price, href)
        csv_Writer.writerow(dit)
