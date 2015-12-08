Welcome To TechConf App Codebase
===================


The TechConf website case study presented is a technology-conference management system encompassing a collection of systems and utilities used to advertise, prepare, and support one or more technology conferences. A technology conference is an event that spans a predetermined period of time and consists of one or more sessions (presentations, keynotes,and so on).

As a frequent speaker and attendee of technology conferences, I thought the domain was well-suited for the purposes of this book. The main stakeholders, that is, the people who have a vested interest in the system, are technologists, just like you and me, which makes it easier to relate to the needs of the user, and consequently, make the gathering of requirements, analysis,and design processes clearer.

Defining the Stakeholders
--------------------------------
To understand the dynamics of the system, it’s important to determine who the stakeholders are and how their individual information needs to change over time. The main stakeholders to
be considered in the context of a technology conference are as follows:

* **Attendees**: individuals attending the conference
* **Presenters**: individuals presenting one or more sessions at a conference
* **Sponsors**: organizations sponsoring and promoting the conference
* **Administrators**: the person or persons organizing and running the conference

To create a clear picture of the changing needs of the stakeholders, it’s useful to view the conference as three separate periods of time: the **preconference**, **the conference**, and **the postconference**
periods. After all, event management is all about timelines. Figure below illustrates the three stages of the conference.

![Tech Conferences Time Line View ](https://raw.githubusercontent.com/sagarmahapatro/TechConf/master/misc/TechConf_time_line_view.PNG)

#Preconference
During the preconference period, data is collected, evaluated, and created. Collected data includes documents such as calls for papers, abstracts, and outlines for the different presentations.
From the collected documents, content must be created and also maintained as the source documents change. Aside from the document management needs, facilities must be provided
for attendees to register and manage the schedule of events they plan to attend. At this time it’s also crucial to provide information in a timely manner to make the process of registering and
getting to the conference easier. Among the experience-enhancing utilities are items that allow you to obtain driving directions or information about special conference rates for travel and
hotel accommodations.

#Conference
The information needs at conference time are crucial to the success of the conference. Satisfied attendees are more likely to return the following year. Being able to cut through the noise,
pinpoint areas of interest, and choose sessions to attend are factors of great importance to improving an attendee’s experience. Providing interactivity and constant feedback ensures
that attendees are always in tune with the heartbeat of the conference. At the beginning of the conference, attendees need to be checked in and given conference badges. Changes or updates
to any sessions or presentations need to be communicated effectively in order for attendees to manage their schedules.

#Postconference
Once the conference has closed its doors, a large amount of work remains to be performed. Attendees are now alumni, and as such they’re a prime target audience for future conferences.
Providing a sense of continuity is important to alumni and future attendees of a technology conference. There should be a bridge from the topics and content of previous conferences to
ongoing and future conferences.

In the realm of document management, these requirements translate to the management of the transition of dynamic documents into static documents or archives. The numerous
documents such as presentation slides, notes, follow-up discussions, and supporting materials related to different presentations or sessions must now be made available to the conference alumni and possibly to the general public. For the organizers of the conference, information such as the number of attendees, the popularity of topics and other statistical information is a crucial business indicator that will determine the future changes and enhancements made to
the conference

General Application Requirements
==========================

##Attendees
Attendees are the primary focus of the system, and greater priority is placed on the functionality that affects them. The requirements of attendees form the basis of the majority of the functionality
of the system.
 
 - **General information**: Prospective attendees (members of the public) need an easy and intuitive way to learn about the details of the conference. The application must be easy to navigate, and the addition of common website functionality such as news and printable views of content must be easily accomplished.
 - **Registration**: Attendees should be able to securely register for the conference and receive confirmation via email. The system should accommodate both individual and group registrations.
 - **Session browsing and selection**: The system should provide intuitive and powerful search capabilities to assist users in the selection of sessions to attend.
 - **Session evaluations**: Presenters should be able to review session evaluations online.
 - **Scheduling**: The system should provide users with the ability to easily view and manage their schedules. The scheduled data should be available in a variety of formats that target different mediums and devices (for example, the Web, personal digital assistants [PDAs], and emails on demand).
 - **Notification and reminders**: The system should provide users with the ability to subscribe to a conference notification service. These notices can include mailing lists, schedule related reminders, and session-related news.
 - **Accommodation assistance**: The system should provide a way for attendees to find area maps, venue maps, hotel directions, locations of interest, restaurants, and other information
to enhance their experience at the conference.

##Presenters
Properly assisting and serving presenters will result in a higher quality of content for the conference. This in turn benefits the primary stakeholders, the attendees.

- **Registration**: Presenters should be able to securely register for the conference and receive confirmation via email.
-  **Profile information**: Presenters should be able to enter contact information and biographical information, upload a picture, and provide other information of interest.
- **Call for papers**: Potential presenters should be able to submit abstracts for a session.The system should allow the presenter to select the target audience, the session track (session category), and the room requirements for a session.
- **Speaker availability**: Presenters should be able to schedule the “office” hours during which they can be available to assist attendees with questions or problems related to
a session.
- **Books by a presenter**: Presenters who are published authors can select one or more books from a list of their published books and associate them with a session. The list of books will be presented as part of the session information. The list of books and the detailed information for each book is obtained from an external provider at runtime.

##Sponsors
Sponsors make a financial investment in a conference. Their interest is based on the rewards of public exposure and an improved industry image. It gives them an opportunity to connect with the community and provides them with a forum to present their products and services.

The presence of high-profile industry players as sponsors legitimizes a technology conference.Ensuring that it’s easy for sponsors to participate in the conference is of the utmost importance to the success of the event.

- **Registration**: The system should allow sponsors to register and select a level of sponsorship.
- **Booth selection**: The system should allow sponsors to select a conference booth. Booths are allocated based on sponsorship level.

##Administrators
Managing the complex interactions of a conference is a challenging process. One of the goals of the system is to ease the tasks of management and reduce the amount of personnel needed.

- **Check-in and registration**: Administrators need to check in attendees as they arrive at the conference and provide them with badges and other materials.
- **Speaker evaluations**: The system should provide administrators with the ability to create and view the results of speaker evaluations.
- **News**: Administrators should have an easy interface to update conference-related news. 
- **Booth assignment**: Administrators should have the ability to select a booth for a sponsor based on sponsorship level and physical requirements.
- **Conference closing**: An interface must be provided for conference administrators to easily transition the selected content into a static site. Specific data now becomes legacy data and must be relocated or archived appropriately.
- **Dashboard**: Utilities must be provided for conference administrators to gather statistics and performance indicators for the conference. These tools should be able to provide a
snapshot view of the overall health and success indicators of the conference.
-------------------
Technologies
--------------------------------
tools
--------------------------------------------


#### javascript run time environment 
* **Node.js** https://nodejs.org/dist/v5.1.1/node-v5.1.1-x64.msi
* **brackets** java script editor https://github.com/adobe/brackets/releases/download/release-1.5%2Beb4/Brackets.1.5.Extract.msi
* **maven** build system http://apache.mirrors.pair.com/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.zip
* **java sdk** http://download.oracle.com/otn-pub/java/jdk/8u65-b17/jdk-8u65-windows-x64.exe
* **eclipse IDE** java development tool http://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/mars/R/eclipse-jee-mars-R-win32-x86_64.zip&mirror_id=1
* **docker** container managment tool  https://github.com/docker/toolbox/releases/download/v1.9.1c/DockerToolbox-1.9.1c.exe

project detail
--
#### broweser-rich-app 
after installing node.js, Please run following commands
*  npm install
* bower install

After succesful completition of above commands, 
then run ** gulp connect**  from command prompt and upon seeing success message
launch browser and enter localhost:4000 in the address bar you will be able to see messsage **"Welcome To Tech Conference Managment System"** 

