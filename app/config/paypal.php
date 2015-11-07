<?php
return array(
    // set your paypal credential
    'client_id' => 'AXo68ySh3DVyKySkTZhPZu9cvU7vI9RQoHlTjXbeDI6GXiBO2VNMTMzw2zFhhgrdMCzYOlRrXHqOq8x9',
    'secret' => 'EA-3WxxY-rSc6UcYU1eLF_A2JGgB6kn4muR8_Pg2jzuOUXEfm6t_esmpCbA6RSat2N4g5jstlqdTn_8i',

    /**
     * SDK configuration 
     */
    'settings' => array(
        /**
         * Available option 'sandbox' or 'live'
         */
        'mode' => 'sandbox',

        /**
         * Specify the max request time in seconds
         */
        'http.ConnectionTimeOut' => 30,

        /**
         * Whether want to log to a file
         */
        'log.LogEnabled' => true,

        /**
         * Specify the file that want to write on
         */
        'log.FileName' => storage_path() . '/logs/paypal.log',

        /**
         * Available option 'FINE', 'INFO', 'WARN' or 'ERROR'
         *
         * Logging is most verbose in the 'FINE' level and decreases as you
         * proceed towards ERROR
         */
        'log.LogLevel' => 'FINE'
    ),
);