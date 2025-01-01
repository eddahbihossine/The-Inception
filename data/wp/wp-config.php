<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * Localized language
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'heddahbi' );

/** Database password */
define( 'DB_PASSWORD', '1234' );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', 'utf8_general_ci' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',          'd|!(PRqK%ud~7PW-WtxFd}7}P6f7U!kATfYbpRVrez_!b>`+{`fpR! w.<_Hvy],' );
define( 'SECURE_AUTH_KEY',   'WO40n>qlLc)z+3-X;M2(0Yx[xdu<tbkT~<1fC~`X0s5zjqF-D$6dS;K>u_n@xN0l' );
define( 'LOGGED_IN_KEY',     'mPtRhcMg]( _u0X~yTg}6od#R33j6#%E!wR:<)[C`D|eYaXMg<mZ &CB&rbn`rDC' );
define( 'NONCE_KEY',         'hptKA@J9|(8E{X3j_Jbe%6h(R_kl=K0ENl$JQXDXx(&Ah=AW8Aa_b$>-Dqc~nhJZ' );
define( 'AUTH_SALT',         'STxze6SijP=/}y#o`T(y 6L-,%z_-m_H2@rb1!y@y,.Vz,BE4&#/wJea=z*C(0%Z' );
define( 'SECURE_AUTH_SALT',  'wDNK+~{rkFxwcep3> UEn%iG!}#W|u,~L;L}WK8$/]:m41D@]*Ag6nQ`n)($d.eY' );
define( 'LOGGED_IN_SALT',    '1aEJoTw-[olf<$ KS9t=o!htKXX`w>2#3}duX^Wv{!iEKA%39gbO1y30`b/oYa-R' );
define( 'NONCE_SALT',        '+WdZ6RIqfN{L8`MXy,kYWEr6V7iacRwHR12t(1&s.e+#e3r5beJ1V^Rq2~M@C;wl' );
define( 'WP_CACHE_KEY_SALT', 'NP98P#usqbt@k:$XP5D>qt+54k9l5p/(IWQm+sggqiuL%d_@eL[L|EpOeRB.D`tp' );


/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';


/* Add any custom values between this line and the "stop editing" line. */



/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
if ( ! defined( 'WP_DEBUG' ) ) {
	define( 'WP_DEBUG', false );
}

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
