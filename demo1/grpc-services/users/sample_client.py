import os

from graft_pypi_users_service import GraftConfig
from graft_pypi_users_service.graft.users_graft import Users


def run():
    GraftConfig.host = os.environ.get('USERS_HOST', 'ws://localhost:50051/ws')
    users = Users
    # Insert example metadata (sent as Graftcode headers)
    GraftConfig.set_headers({'ip': '127.0.0.1'})
    response = users.create_user('tom', '', '')
    if response:
        print("User created:", response.username)
    request = (["alexa", "christie"], [1, 1])
    response = users.get_users(*request)
    for resp in response:
        print("user {", "username:", resp.username, "user_id:", resp.user_id, "}")


if __name__ == '__main__':
    run()
