//
// Copyright 2015-2016 by Garmin Ltd. or its subsidiaries.
// Subject to Garmin SDK License Agreement and Wearables
// Application Developer Agreement.
//

using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Lang as Lang;
using Toybox.Time.Gregorian;
using Toybox.WatchUi as Ui;

class SkoadWatchView extends Ui.WatchFace {

    private var skoadFace as BitmapResource?;

    function initialize() {
        WatchFace.initialize();
    }

    function onLayout(dc) {
        setLayout($.Rez.Layouts.WatchFace(dc));
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();

        skoadFace = Ui.loadResource($.Rez.Drawables.SkoadFace) as BitmapResource;
    }

    //! Restore the state of the app and prepare the view to be shown
    function onShow() {
    }

    public function onUpdate(dc) {
        var clockTime = Sys.getClockTime();
        var timeString = Lang.format("$1$:$2$:$3$", [clockTime.hour, clockTime.min.format("%02d"), clockTime.sec.format("%02d")]);
    

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        dc.clear();
    
//        dc.drawBitmap(dc.getWidth()/2, dc.getHeight()/2, skoadFace);
          dc.drawBitmap(20, 10, skoadFace);
      
       /* dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();*/   
        dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT);
        dc.drawText(120, 20, Gfx.FONT_LARGE, timeString, Gfx.TEXT_JUSTIFY_CENTER);
        
        /*var view = View.findDrawableById("TimeLabel") as Text;
        view.setText(timeString);
        View.onUpdate(dc);*/
    }
}

