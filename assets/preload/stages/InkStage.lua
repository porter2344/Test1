function onCreate()
	-- background shit
	makeLuaSprite('bg', 'InkStage', -1000, -550);
    addLuaSprite('bg', false);
    scaleObject('bg', 2.4, 2.4);
end
function onUpdate()
glitchAmount=getProperty('Glitch.x')

if startGlitching then

		setShaderFloat('background','prob',glitchAmount / 4)
		if not endGlitching then
			setShaderFloat('background','time',(math.floor((getSongPosition() / crochet)) * crochet) / 1000)
	    end

		setShaderFloat('FiltreRef','prob',0.25 - (glitchAmount / 8))
		if not endGlitching then
			setShaderFloat('FiltreRef','time',(math.floor((getSongPosition() / crochet)) * crochet) / 1000)
	    end
		setShaderFloat('dad','binaryIntensity',(10 - ((math.floor(glitchAmount / 20) * 20) * 9)) / 8)
	end
end
function onEvent(eventName, value1, value2)
    if eventName=='Missingno Tempo Change' then
		startGlitching=true
	end
    function SetShader()
        makeLuaSprite('FiltreRef')
        if shadersEnabled then
            runHaxeCode([[
                var shaderName = "glitch";
        
                var shader0 = game.createRuntimeShader(shaderName);
                game.camGame.setFilters([new ShaderFilter(shader0)]);
                game.getLuaObject("FiltreRef").shader = shader0;
            ]])
        end
    end
    end    
