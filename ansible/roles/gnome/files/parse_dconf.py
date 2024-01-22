import sys
import json

def parse_dconf(dconf_data):
    dconf_dict = {}
    current_uuid = ""
    for line in dconf_data.splitlines():
        if line.startswith("["):
            current_uuid = line.strip("[]:")
        elif line.startswith("visible-name="):
            visible_name = line.split('=')[1].strip("'")
            dconf_dict[visible_name] = current_uuid
    return dconf_dict

if __name__ == "__main__":
    dconf_data = sys.stdin.read()
    parsed_data = parse_dconf(dconf_data)
    print(json.dumps(parsed_data))
