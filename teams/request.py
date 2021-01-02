import sqlite3
import json


def get_teams():
    # Open a connection to the database
    with sqlite3.connect("./flagons.db") as conn:
        conn.row_factory = sqlite3.Row
        db_cursor = conn.cursor()

        # Write the SQL query to get the information you want
        db_cursor.execute("""
        SELECT
            t.id,
            t.name,
            ts.score
        FROM Teams t
        LEFT OUTER JOIN TeamScore ts ON ts.teamId = t.id
        """)

        # Initialize an empty list to hold all customer representations
        teams = {}
        dataset = db_cursor.fetchall()

        # Iterate all rows of data returned from database
        for row in dataset:
            score = int(row['score']) if row['score'] is not None else 0
            if row['id'] in teams:
                teams[row['id']]['scores'].append(score)
            else:
                teams[row['id']] = {}
                teams[row['id']]['id'] = row['id']
                teams[row['id']]['players'] = []
                teams[row['id']]['name'] = row['name']
                teams[row['id']]['scores'] = [score]

        db_cursor.execute("""
        SELECT
            t.id,
            t.name,
            p.firstName,
            p.lastName
        FROM Teams t
        JOIN Players p ON p.teamId = t.id
        """)
        dataset = db_cursor.fetchall()

        # Iterate all rows of data returned from database
        for row in dataset:
            player = { 'firstName': row['firstName'], 'lastName': row['lastName'] }
            if row['id'] in teams:
                teams[row['id']]['players'].append(player)
            else:
                teams[row['id']] = {}
                teams[row['id']]['players'] = [player]

    return json.dumps(list(teams.values()))

