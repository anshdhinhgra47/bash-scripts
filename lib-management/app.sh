#!/bin/bash

# Credits for the ASCII Art: https://www.asciiart.eu/books/books

total_books=0

declare -a book_list

function greeting {
    ascii_art
    printf "\n Welcome to the Library Database"
}

function add_new_book {
    printf "Enter Book Title: \n"
    read book_title
    printf "Enter Book Author: \n"
    read book_author

    book_list[$book_title]=$book_author
    total_books=$((total_books+1))

    echo "Book Added!"
    choices_menu
}

function delete_book {
    echo "Enter the title of the book you want to delete: "
    read del_book_author
    unset book_list[$del_book_author]
    total_books=$((total_books-1))
    echo "Book Deleted"
    choices_menu
}

function display_all {
    if [[ $total_books -eq 0 ]]
    then
        echo "Sorry No books to show!"
    else
        for book in "${!book_list[@]}"; do
            echo "$book_title by ${book_list[$book_author]}"
done
    fi
    choices_menu
}

function send_to_function {
    if [[ $1 -eq 1 ]]
    then
        add_new_book
    elif [[ $1 -eq 2 ]]; then
        delete_book
    elif [[ $1 -eq 3 ]]; then
        display_all
    elif [[ $1 -eq 4 ]]; then
        echo $'\n'
        echo "Good Bye!"
    else 
        echo $'\n'
        echo "Sorry Wrong Input! Please Try again!"
        echo $'\n'
        choices_menu
    fi
}

function choices_menu {
    printf "\n Please choose from one of the following: \n"
    printf "\t 1. Add new book \n"
    printf "\t 2. Delete a book \n"
    printf "\t 3. Display all books \n"
    printf "\t 4. Quit Program \n"
    printf "Please enter your choice: \n"
    read choice

    send_to_function $choice
}


function main_menu {
    greeting
    choices_menu
}

function ascii_art {

echo "
       .--.                   .---.
   .---|__|           .-.     |~~~|
.--|===|--|_          |_|     |~~~|--.
|  |===|  |'\     .---!~|  .--|   |--|
|%%|   |  |.'\    |===| |--|%%|   |  |
|%%|   |  |\.'\   |   | |__|  |   |  |
|  |   |  | \  \  |===| |==|  |   |  |
|  |   |__|  \.'\ |   |_|__|  |~~~|__|
|  |===|--|   \.'\|===|~|--|%%|~~~|--|
^--^---'--^    `-'`---^-^--^--^---'--' 
"
}

main_menu
