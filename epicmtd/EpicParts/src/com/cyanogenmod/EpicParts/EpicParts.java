package com.cyanogenmod.EpicParts;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.preference.CheckBoxPreference;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.preference.PreferenceManager;
import android.preference.PreferenceScreen;
import android.util.Log;
import android.view.Gravity;
import android.widget.Toast;

public class EpicParts extends PreferenceActivity  {
    public static final String KEY_TOUCHKEYLED = "touchkey_led";
    private static final String TOUCHKEY_LED_FILE = "/sys/devices/virtual/sec/t_key/touchleds_disabled";
    private static final String PREF_ENABLED = "1";
    private static final String TAG = "EpicParts_General";

    private CheckBoxPreference mBacklightTimeout;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        addPreferencesFromResource(R.xml.main);

        mBacklightTimeout = (CheckBoxPreference) findPreference(KEY_TOUCHKEYLED);
        mBacklightTimeout.setEnabled(isSupported(TOUCHKEY_LED_FILE));
        //mBacklightTimeout.setOnPreferenceChangeListener(new TouchKeyBacklight());
        
    }
    
    @Override
    public boolean onPreferenceTreeClick(PreferenceScreen preferenceScreen, Preference preference) {

        String boxValue;
        String key = preference.getKey();

        Log.w(TAG, "key: " + key);
	if (key.equals(KEY_TOUCHKEYLED)) {
            final CheckBoxPreference chkPref = (CheckBoxPreference) preference;
            boxValue = chkPref.isChecked() ? "1" : "0";
            Utils.writeValue(TOUCHKEY_LED_FILE, boxValue);

	    Toast toast = Toast.makeText(this, R.string.touchkey_led_toast_message, Toast.LENGTH_LONG);
	    toast.setGravity(Gravity.CENTER_VERTICAL, 0, 0);
	    toast.show();
        }

        return true;
    }
    
    public static boolean isSupported(String FILE) {
        return Utils.fileExists(FILE);
    }

    public static void restore(Context context) {
        SharedPreferences sharedPrefs = PreferenceManager.getDefaultSharedPreferences(context);
        if (isSupported(TOUCHKEY_LED_FILE)) {
            String sDefaultValue = Utils.readOneLine(TOUCHKEY_LED_FILE);
            Utils.writeValue(TOUCHKEY_LED_FILE, sharedPrefs.getBoolean(KEY_TOUCHKEYLED, PREF_ENABLED.equals(sDefaultValue)));
        }
    }
}
