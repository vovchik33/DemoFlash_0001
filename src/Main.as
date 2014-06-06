package {

import com.demonsters.debugger.MonsterDebugger;

import flash.display.Sprite;
import flash.display.Stage;
import flash.text.TextField;

import org.as3commons.logging.api.LOGGER_FACTORY;
import org.as3commons.logging.api.getLogger;

import org.as3commons.logging.setup.LevelTargetSetup;
import org.as3commons.logging.setup.LogSetupLevel;
import org.as3commons.logging.setup.target.MonsterDebugger3TraceTarget;
import org.as3commons.logging.setup.target.TextFieldTarget;
import org.as3commons.logging.setup.target.mergeTargets;

use namespace LOGGER_FACTORY;

public class Main extends Sprite {
    private var textField:TextField;

    public function Main() {
        textField = new TextField();
        textField.width = stage.stageWidth;
        addChild(textField);

        MonsterDebugger.initialize(this);
        LOGGER_FACTORY.setup = new LevelTargetSetup(mergeTargets(new MonsterDebugger3TraceTarget(), new TextFieldTarget(null,textField)), LogSetupLevel.DEBUG);

        getLogger(this).info("Hello, World");
    }
}
}
