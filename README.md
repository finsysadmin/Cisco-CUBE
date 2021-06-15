
<!-- [![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]
 -->


<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/othneildrew/Best-README-Template">
    <img src="images/logo.png" alt="Logo" width="280" height="180">
  </a>


  <h3 align="center">Cisco CUBE Project</h3>



 




<!-- ABOUT THE PROJECT -->
## About The Project

[![Product Name Screen Shot][product-screenshot]](https://github.com/finsysadmin/Cisco-CUBE/blob/stanWork/.images/intellij.png)

## Description

A Python script to automate assignment of preference to voice dial peers based on the calling rate of a specific destination for each SIP Trunk provider in an enterprise and therefore achieving least cost routing.


### Built With

* Python 3.9


#### Software versions Used

* Cisco CSR 1000V - csr1000v-universalk9.16.12
* Cisco Unified Border Element Version 14
* Microsoft SQL Server Express 2019

### Python Libraries
* Paramiko
* http.client

### Database

The following Tables exists.

| Tables                             | Contains |
|------------------------------------|-------------|
| `areacode`                         | Service Provider code (SPCode), Destination area code (AREA), Charges per minute for the respective destination code (UNIT_CHG). |
| `gateway`                          | Service provider code (SCODE). An organization can have more than one service provider and each service provider can have more |   |                                    |than one gateway. |
|`pref_sip_operators`                |Preference (PREF), Area Code (AREA), Service provider code (SPCODE) and Gateway(GW).

**Stored procedure**

***util_get_sip_rank***
This is routine is called by the script and pass the phone number calling to return the dial peer preferences  


<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running follow these simple steps.

### Prerequisites

#### Program setup
Install the following libraries 
 pip 
  ```sh
 pip install pip --upgrade --user
  ```


### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/finsysadmin/Cisco-CUBE.git
   ```
3. Edit Database credentials accordingly to connect to your DB on `function dbconnect`

4. Install paramiko 
```sh
pip install paramiko
```
5. install pydoc
```sh
pip install pydoc
```
6.install http client library
```sh
pip install http.client
```
7.  Run the program `main`

## Configuration before running script
1. Configure your database  to connect correctly by replacing data on __`def dbconnect`__ appropriately

2. Enter the configurations of your cisco device by providing hostname,port,username and password to connect.

<!-- USAGE EXAMPLES -->
## Database Operations
By callling Database stored procedure `util_get_sip_rank ` and passing the __dialing Number__ as parameter, the procedure returns the charges for the respective
country code and arrange them in ascending order.

__For example__ the result shown below :

|PREF (Preference)|AREA (Area Code )|UNIT_CHG |	QOS_RATE|	SPCODE (Service provider code )|	GW (Gateway)|SIPSTATUS |
|-----|-----|---------|---------|-------------|----|---------|
|1 |	254|	0.060000 |	NULL|			02|	0|	NULL|
|2	|254	|0.060000	|NULL			|02	|1	|NULL|
|3|	254	|0.060000	|NULL		|	02	|2	|NULL|
|4	|254	|0.091700	|NULL	|		06	|0	|NULL|
|5	|254|	0.091700	|NULL|			05	|0	|NULL|

## Call flow
Application will read the database, check that the dial peer preferences and set them for each destination using the ` def write_config(self)` function.


#### For example for international calls to Kenya with country code +254:
 
 dial-peer voice 12541 voip 
 preference 1   
 destination-pattern 00254T  
 session protocol sipv2   
 session target ipv4:1.1.1.1   
 
 
! 
 dial-peer voice 12542 voip  
 preference 2  
 destination-pattern [08]00T   
 session protocol sipv2  
 session target ipv4:2.2.2.2  
 
 
##### _Outgoing calls will be sent through the provider specified in the dial peer with the lowest preference for that destination_

## Code Samples

### DB connect function

```
def dbconnect(self, server=None):
        server = "Ip address"
        database = "DBname"
        tcon = "yes"
        uname = "username"
        pword = "pass"

        conn = pyodbc.connect(driver='{SQL Server Native Client 11.0}', host=server, database=database,
                              user=uname, password=pword)
        self.connection = conn
```
### Write config to cisco device
```
 def write_config(self):
        preference = 0
        for dial_peer in self.preferences:
            # Create dial peer
            peer = str(1) + str(dial_peer.AREA) + str(dial_peer.SPCODE) + str(dial_peer.GW)
            # write dial peer and preference
            self.connection.send("dial-peer voice " + peer + " voip\n")  # dial-peer voice 1 254 3 voip
            self.connection.send("preference " + str(preference) + "\n")  # preference 0
            preference = preference + 1
            time.sleep(1)

        router_output = self.connection.recv(65535)
        # Test for reading command output
        print(str(router_output) + "\n")
 ```


## Credits
1. [Cyrus Muchiri](https://github.com/CyrusFinsysGroup) 
2. Mwaura Gitonga(https://github.com/mwauragitonga)
3. [Stanley Mandela](https://github.com/StanMandela)

<!-- ROADMAP -->
## Roadmap

See the [open issues](https://github.com/finsysadmin/Cisco-CUBE/issues) for a list of proposed features (and known issues).



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request



<!-- LICENSE -->
## License

Distributed under the [MIT License](LICENSE).  for more information.



<!-- CONTACT -->
## Contact


Project Link: [https://github.com/finsysadmin/Cisco-CUBE](https://github.com/finsysadmin/Cisco-CUBE)



<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements
* [GitHub Emoji Cheat Sheet](https://www.webpagefx.com/tools/emoji-cheat-sheet)
* [Img Shields](https://shields.io)
* [Choose an Open Source License](https://choosealicense.com)
* [GitHub Pages](https://pages.github.com)






<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-url]: https://github.com/finsysadmin/Cisco-CUBE/graphs/contributors
<!-- [forks-shield]: https://img.shields.io/github/forks/othneildrew/Best-README-Template.svg?style=for-the-badge -->
[forks-url]: https://github.com/finsysadmin/Cisco-CUBE/network/members
<!-- [issues-shield]: https://img.shields.io/github/issues/othneildrew/Best-README-Template.svg?style=for-the-badge -->
[issues-url]: https://github.com/othneildrew//issues
<!-- [license-shield]: https://img.shields.io/github/license/othneildrew/Best-README-Template.svg?style=for-the-badge -->
<!-- [linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555 -->
[product-screenshot]: images/intellij.png
