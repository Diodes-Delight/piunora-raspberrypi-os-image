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

def install(package):
    subprocess.check_call([sys.executable, "-m", "pip", "install", package])

print(bcolors.HEADER+"Fetching latest library list"+bcolors.ENDC)

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

for package in package_names:
	print(package)
	# this is way slower than doing them all at once but we can't trust that each package will install
	# successfully so in order to prevent one package from failing all we need to do it one by one
	try:
		install(package)

	except KeyboardInterrupt:
		break
	except:
		failed_packages += str(package)+" "
		print(bcolors.FAIL+"error installing "+str(package)+bcolors.ENDC)

if failed_packages != "":
	print(bcolors.FAIL+"The following packages failed to install: "+str(failed_packages)+bcolors.ENDC)

print(bcolors.OKGREEN+"Done!"+bcolors.ENDC)
