
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
    <img src="images/logo.png" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">Best-README-Template</h3>

 




<!-- ABOUT THE PROJECT -->
## About The Project

[![Product Name Screen Shot][product-screenshot]](https://example.com)

## Description

A Python script to automate assignment of preference to voice dial peers based on the calling rate of a specific destination for each SIP Trunk provider in an enterprise and therefore achieving least cost routing.

## Use
Reduce cost of calling charges by routing to use the dial peer that has the fairest charges.

### Built With

* Python 3.9

### Libraries
* Paramiko
* http.client



<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running follow these simple steps.

### Prerequisites

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
3. Edit Database credentials accordingly to connect to your DB on `func` `dbconnect`

4. Install paramiko 
```sh
pip install paramiko
```
5. install pydoc
```sh
pip install pydoc
```
6.install http client library
```py
pip install http.client
```

7.  Run the program `main`

<!-- USAGE EXAMPLES -->
## Usage

Automating dial peer  preferences assignment. Lower rates of calling incured as the dial peer will be configured to use the prefernces with the least cost. 

## Code Samples
### DB connect function

```
def dbconnect(self, server=None):
        server = "10.244.0.5"
        database = "DevNet"
        tcon = "yes"
        uname = "sa"
        pword = "K0Junga#"
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
_For more examples, please refer to the [Documentation](https://example.com)_



<!-- ROADMAP -->
## Roadmap

See the [open issues](https://github.com/othneildrew/Best-README-Template/issues) for a list of proposed features (and known issues).



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

Distributed under the MIT License. See `LICENSE` for more information.



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
[contributors-shield]: https://img.shields.io/github/contributors/othneildrew/Best-README-Template.svg?style=for-the-badge
[contributors-url]: https://github.com/finsysadmin/Cisco-CUBE/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/othneildrew/Best-README-Template.svg?style=for-the-badge
[forks-url]: https://github.com/finsysadmin/Cisco-CUBE/network/members
[stars-shield]: https://img.shields.io/github/stars/othneildrew/Best-README-Template.svg?style=for-the-badge
[stars-url]: https://github.com/othneildrew/Best-README-Template/stargazers
[issues-shield]: https://img.shields.io/github/issues/othneildrew/Best-README-Template.svg?style=for-the-badge
[issues-url]: https://github.com/othneildrew/Best-README-Template/issues
[license-shield]: https://img.shields.io/github/license/othneildrew/Best-README-Template.svg?style=for-the-badge
[license-url]: https://github.com/othneildrew/Best-README-Template/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/othneildrew
[product-screenshot]: images/screenshot.png
