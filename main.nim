import std/random
import std/httpclient

# init rng
randomize()



proc getFuzz(lenght: int, possibleFuzz: string): string =
    result = ""
    for i in 1 .. lenght:
        result.add(sample(possibleFuzz))


proc scrapeCatbox(fileEnding: string): string =
    let
        url: string = "https://files.catbox.moe/" & getFuzz(6, "abcdefghijklmnopqrstuvwxyz0123456789") & fileEnding
        client: HttpClient = newHttpClient()

    
    if client.get(url).code != Http404:
        return url



# valid urls will be printed to stdout
while true:
    try:
        var response: string = scrapeCatbox(".png")
        if response != "":
          echo response
    except ProtocolError as e:
        echo e.msg
        continue
    
