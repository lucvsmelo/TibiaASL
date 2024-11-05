state("LiveSplit") { }

startup
{   
    var localAppData = Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData);

    vars.Watcher = new FileSystemWatcher()
    {
        Path = localAppData + @"\Tibia\packages\Tibia\screenshots",
        Filter = "*.png",
        EnableRaisingEvents = true
    };
    
    vars.Watcher.Created += new FileSystemEventHandler((sender, e) => vars.NewScreenshotCreated = true);

    vars.NewScreenshotCreated = false;
}

onSplit
{
    vars.NewScreenshotCreated = false;
}

split
{
    return vars.NewScreenshotCreated;
}