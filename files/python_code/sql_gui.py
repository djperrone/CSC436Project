from tkinter.constants import FALSE
import PySimpleGUI as sg
import mysql.connector
from mysql.connector import Error
import pandas as pd
sg.theme('Dark')   # Add a touch of color

Query = None



def create_db_connection(host_name, user_name, user_password, db_name):
    connection = None
    success = False
    try:
        connection = mysql.connector.connect(
            host=host_name,
            user=user_name,
            passwd=user_password,
            database=db_name,
            autocommit = True
        )
        success = True
        print("MySQL Database connection successful")
    except Error as err:
        success = False
        print(f"Error: '{err}'")

    return connection, success

def execute_query(connection, query):
    cursor = connection.cursor()
    try:
        cursor.execute(query)
        connection.commit()
        print("Query successful")
    except Error as err:
        print(f"Error: '{err}'")

def read_query(connection, query):
    cursor = connection.cursor()
    result = None
    try:
        cursor.execute(query)
        result = cursor.fetchall()
        return result
    except Error as err:
        print(f"Error: '{err}'")




# login screen
section1 = [
    [sg.Text('Enter Password')],          
    [sg.Input('', key = 'pwd',do_not_clear=False)],
    [sg.Button('Ok',  button_color=('white', 'purple'),k="go_to_main_menu")]]

# main menu
section2 = [
    [sg.Text('Select an Item:')], 
    [sg.Button('Search',  button_color=('white', 'purple'),k="search_menu")],
    [sg.Button('Create Table',  button_color=('white', 'purple'),k='create_table_menu')],
    [sg.Button('Insert',  button_color=('white', 'purple'),k='insert_table_menu')],
    [sg.Button('Custom Query',  button_color=('white', 'purple'),k='custom_query_menu')]]

# select menu
section3 = [
    [sg.Text('select')],
    [sg.Input('',k='search_item',do_not_clear=False)],
    [sg.Text('from')],
    [sg.Input('', k='search_table',do_not_clear=False)],
    [sg.Button('Enter Search',  button_color=('white', 'purple'),k='search')],
    [sg.Button('Main Menu',  button_color=('white', 'purple'),k='main_menu')]]
          
# create table menu
section4 = [[sg.Text('create table ')],
            [sg.Input('',k='create_table_value',do_not_clear=False)],           
            [sg.B('Create', button_color=('yellow', 'purple'),k='create_table')],
            [sg.Button('Main Menu',  button_color=('white', 'purple'),k='main_menu')]] 
#insert menu
section5 = [[sg.Text('Insert ')],
            [sg.Input('',do_not_clear=False, k='insert_values')],  
            [sg.Text('into ')],
            [sg.Input('',do_not_clear=False, k='insert_table')],          
            [sg.Button('Insert',  button_color=('white', 'purple'),k='do_insert')],         
              
            [sg.Button('Main Menu',  button_color=('white', 'purple'),k='main_menu')]]            

# menu for any sql query
section6 = [[sg.Text('Custom Query')],
            [sg.Input('',k='query_input',do_not_clear=False)],           
            [sg.B('Run', button_color=('yellow', 'purple'),k='custom_query')],
            [sg.Button('Main Menu',  button_color=('white', 'purple'),k='main_menu')]] 

# layout of gui - create a column for each section
layout =   [[sg.Text('Streaming Platform DataBase')],           
            #### Section 1 part ####
            [sg.pin(sg.Column(section1, key='-COL1-'))],
            [sg.pin(sg.Column(section2, key='-COL2-', visible=False))],
            [sg.pin(sg.Column(section3, key='-COL3-', visible=False))],
            [sg.pin(sg.Column(section4, key='-COL4-', visible=False))],
            [sg.pin(sg.Column(section5, key='-COL5-', visible=False))],
            [sg.pin(sg.Column(section6, key='-COL6-', visible=False))],
           
            [sg.Button('Exit')]]

def make_select_query(item : str, table : str):
    return "select " + item + " from " + table


def main():
# create the window
    
    window = sg.Window('Streaming Platform DataBase', layout)
    
    # use event keys to jump to different menus
    menuDict = {}
    menuDict['login'] = 1
    menuDict['main_menu'] = 2
    menuDict['search_menu'] = 3
    menuDict['create_table_menu'] = 4
    menuDict['insert_table_menu'] = 5
    menuDict['custom_query_menu'] = 6
    
    queries_dict = {}
 
   
    loggedIn = False            
    password = ""
    isRunning = True    
    connection = None
    layout_index = 1
    
    while isRunning:
        #while True:
        event, values = window.read()
        
        if event == sg.WIN_CLOSED or event == 'Exit':
            isRunning = False
            return
            #break
        
        if event == "go_to_main_menu" and loggedIn == False:
            password = values['pwd']           
            connection, loggedIn = create_db_connection("localhost", "root",password, "Streaming")    
            
            if loggedIn:
                window[f'-COL{layout_index}-'].update(visible=False)
                layout_index = menuDict['main_menu']
                window[f'-COL{layout_index}-'].update(visible=True)
                
        if event.startswith("main_menu"):             
            window[f'-COL{layout_index}-'].update(visible=False)
            layout_index = menuDict['main_menu']
            window[f'-COL{layout_index}-'].update(visible=True)
            
        if event == "search_menu":            
            window[f'-COL{layout_index}-'].update(visible=False)
            layout_index = menuDict[event]
            window[f'-COL{layout_index}-'].update(visible=True)          

        if event == "create_table_menu":                
            window[f'-COL{layout_index}-'].update(visible=False)
            layout_index = menuDict[event]
            window[f'-COL{layout_index}-'].update(visible=True)
            
        if event == "insert_table_menu":                
            window[f'-COL{layout_index}-'].update(visible=False)
            layout_index = menuDict[event]
            window[f'-COL{layout_index}-'].update(visible=True)
            
        if event == "search": 
            try:   
                print("query running...")
                
                results = read_query(connection, make_select_query(values['search_item'],values['search_table']),)
                for i in range(len(results)):
                    print([j for j in results[i]])
                if len(results) == 0:
                    print("table is empty")
                print("query complete")
                
            except:
                print("query failed")
                
        if event == "do_insert": 
            try:   
                print("inserting values ", values['insert_values'], " into ", values['insert_table'])
                insert_q = "Insert into "+values['insert_table']+" values("+ values['insert_values'] + ');'
                #print(insert_q)
                results = read_query(connection, insert_q)
                print("query complete")
              
            except:
                print("query failed")                    
            
        if event == "custom_query_menu":                
            window[f'-COL{layout_index}-'].update(visible=False)
            layout_index = menuDict[event]
            window[f'-COL{layout_index}-'].update(visible=True)    
            
        if event == "create_table":     
            try: 
                print("query running...")
                
                q = "create table if not exists " + values['create_table_value']+'( '+ values['create_table_value']+'id'+' int unique not null);'               
                results = read_query(connection, q)
                print("created table " + values['create_table_value'])
            except:
                print("query failed")
            
        if event == "custom_query":             
            try: 
                results = read_query(connection, values['query_input'] + ';')
                print("query running...")
            
                for i in range(len(results)):
                    print([j for j in results[i]])
                print("query complete")
            except:
                print("query failed")
    #connection.commit()
    #cursor.close()
    connection.close()

main()