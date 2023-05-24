*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BOOK_TITLE}   Design patterns: elements of reusable object-oriented software
${BOOK_AUTHOR}  Erich Gamma, Richard Helm, Ralph Johnson, John Vlissides
${BOOK_GENRE}   Information Technology
${BOOK_PRICE}   25.11
${BOOK_COVER}   https://m.media-amazon.com/images/I/51MAu0VlUkL._SX395_BO1,204,203,200_.jpg
${BOOK_DESCRIPTION}     Capturing a wealth of experience about the design of object-oriented software, four top-notch designers present a catalog of simple and succinct solutions to commonly occurring design problems. Previously undocumented, these 23 patterns allow designers to create more flexible, elegant, and ultimately reusable designs without having to rediscover the design solutions themselves.
*** Keywords ***
Go to create book page
    click link    Create book

Go to Update/delete books page
    click link    Update/delete books

Use valid book data
    input text    name=title    ${BOOK_TITLE}
    input text    name=author   ${BOOK_AUTHOR}
    input text    name=genre    ${BOOK_GENRE}
    input text    name=price    ${BOOK_PRICE}
    input text    name=cover    ${BOOK_COVER}
    input text    name=description  ${BOOK_DESCRIPTION}
    click button    Create book

Input book data with empty title field
    input text    name=author   ${BOOK_AUTHOR}
    input text    name=genre    ${BOOK_GENRE}
    input text    name=price    ${BOOK_PRICE}
    input text    name=cover    ${BOOK_COVER}
    input text    name=description  ${BOOK_DESCRIPTION}
    click button    Create book

Input book data with empty author field
    input text    name=title    ${BOOK_TITLE}
    input text    name=genre    ${BOOK_GENRE}
    input text    name=price    ${BOOK_PRICE}
    input text    name=cover    ${BOOK_COVER}
    input text    name=description  ${BOOK_DESCRIPTION}
    click button    Create book

Input book data with empty genre field
    input text    name=title    ${BOOK_TITLE}
    input text    name=author   ${BOOK_AUTHOR}
    input text    name=price    ${BOOK_PRICE}
    input text    name=cover    ${BOOK_COVER}
    input text    name=description  ${BOOK_DESCRIPTION}
    click button    Create book

Input book data with empty price field
    input text    name=title    ${BOOK_TITLE}
    input text    name=author   ${BOOK_AUTHOR}
    input text    name=genre    ${BOOK_GENRE}
    input text    name=cover    ${BOOK_COVER}
    input text    name=description  ${BOOK_DESCRIPTION}
    click button    Create book

Input book data with empty cover field
    input text    name=title    ${BOOK_TITLE}
    input text    name=author   ${BOOK_AUTHOR}
    input text    name=genre    ${BOOK_GENRE}
    input text    name=price    ${BOOK_PRICE}
    input text    name=description  ${BOOK_DESCRIPTION}
    click button    Create book

Input book data with empty description field
    input text    name=title    ${BOOK_TITLE}
    input text    name=author   ${BOOK_AUTHOR}
    input text    name=genre    ${BOOK_GENRE}
    input text    name=price    ${BOOK_PRICE}
    input text    name=cover    ${BOOK_COVER}
    click button    Create book

Update book title with valid data
    click button    update-book-5
    input text    name=title    Design patterns
    click button    Update book

Update book title with empty title field
    click button    update-book-5
    clear element text    name=title
    click button    Update book

Update book author with empty author field
    click button    update-book-5
    clear element text    name=author
    click button    Update book

Update book genre with empty genre field
    click button    update-book-5
    clear element text    name=genre
    click button    Update book

Update book price with empty price field
    click button    update-book-5
    clear element text    name=price
    click button    Update book

Update book cover with empty cover field
    click button    update-book-5
    clear element text    name=cover
    click button    Update book

Update book description with empty description field
    click button    update-book-5
    clear element text    name=description
    click button    Update book

Delete book
    wait until element is visible    id=delete-book-5
    sleep     3s
    click button    id=delete-book-5
    sleep    3s