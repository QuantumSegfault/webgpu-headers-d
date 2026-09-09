import std.io : FileIopipe = File;
import iopipe.refc : refCounted;
import iopipe.bufpipe;
import iopipe.textpipe;
import iopipe.valve;
import iopipe.buffer;
import iopipe.json.parser;
import iopipe.json.serialize;

@ignoreExtras
struct API {
    string _comment;
}

void main()
{
    auto api = FileIopipe("generator/webgpu-headers/webgpu.json").refCounted.bufd
        .assumeText.deserialize!API;
}
