## MQTT topics

- lampethere
    - /group
        - /**{groupID}**
            - /name
            - /config
                - /expire_messages_after 
            - /messages ["ids of devices that pressed"]
            - /first_message timestamp
            - /last_message timestamp 
    - /device
        - /**{deviceID}**
            - /config
                - /colors **[RETAINED]** ["#rgb_1","#rgb_2"]
                - /groups **[RETAINED]** ["id_2",..]
                - /name **[RETAINED]** "human readable name"
            - /version Active firmware version
            - /heartbeat incremental number from 0 since boot, every 10 sec.
