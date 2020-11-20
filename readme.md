This is a temporary repository to hold code sandboxes, draft designs etc..

The current MQTT layout is as follows:

- /lampethere
    - /group
        - /**{groupID}**
            - /message
            - /name **[RETAINED]**
    - /device
        - /**{deviceID}**
            - /message
            - /online
            - /version
            - /config
                - /color
                    - /set **[RETAINED]**
                - /name
                    - /set **[RETAINED]**
                - /groups
                    - /set **[RETAINED]**
