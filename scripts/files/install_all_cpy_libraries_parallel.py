import re
import requests
import io
import subprocess
import sys

class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKCYAN = '\033[96m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'


print(bcolors.HEADER+"Fetching latest library list"+bcolors.ENDC)

skip_list = ["adafruit-circuitpython-ducky"]

#a bit hacky to parse markdown but it is currently the only automatically maintained list of Adafruit Libraries
adafruit_bundle = "https://raw.githubusercontent.com/adafruit/Adafruit_CircuitPython_Bundle/main/circuitpython_library_list.md"
community_bundle = "https://raw.githubusercontent.com/adafruit/CircuitPython_Community_Bundle/master/circuitpython_community_library_list.md"

r = requests.get(adafruit_bundle, allow_redirects=True)

package_names = []
for line in str(r.content).splitlines():
    package_names = re.findall("https://pypi\.org/project/(.*?)\)", line)


r = requests.get(community_bundle, allow_redirects=True)

for line in str(r.content).splitlines():
    package_names.extend(re.findall("https://pypi\.org/project/(.*?)\)", line))

def stripSlash(name):
    return name.strip("/")

package_names = list(map(stripSlash, package_names))

print(package_names)

failed_packages = ""

for package in skip_list:
    package_names.remove(package)

print(package_names)

cmd = [sys.executable, "-m", "pip", "install"]
cmd.extend(package_names)
print(cmd)
subprocess.check_call(cmd)

print(bcolors.OKGREEN+"Done!"+bcolors.ENDC)
