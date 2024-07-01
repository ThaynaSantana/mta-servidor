local image = dxCreateTexture("assets/logo.png", "dxt1", true, "clamp")


addEventHandler("onClientRender", root, function()
	dxDrawImage(
		0, 0,
		512, 512,
		image
	)
end)