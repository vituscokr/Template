
func log(message: String,
    function: String = __FUNCTION__,
    file: String = __FILE__,
    line: Int = __LINE__) {

        let url = NSURL(fileURLWithPath: file)

        print("Message \"\(message)\" (File: \(url.lastPathComponent ?? "?"), Function: \(function), Line: \(line))")
}

log("some message")
