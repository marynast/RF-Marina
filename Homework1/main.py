import time


def get_current_hour():
    current_time = time.localtime()
    current_hour = current_time.tm_hour
    return current_hour


print(get_current_hour())


def get_hours_list():
    hours_list = []
    for i in range(get_current_hour()):
        hours_list.append(i)
    return len(hours_list)


print(get_hours_list())