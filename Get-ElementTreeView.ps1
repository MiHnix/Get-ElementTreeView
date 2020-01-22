$url = 'https://www.w3schools.com/howto/tryit.asp?filename=tryhow_js_treeview'

#$data = Invoke-WebRequest -Uri 'https://www.w3schools.com/howto/tryit.asp?filename=tryhow_js_treeview'

# reading website data:
$data = Invoke-WebRequest -Uri $URL 
$myPSObject = @() 
# get the first table found on the website and write it to disk:
$myPSObject = $data.ParsedHtml.getElementByID("bbp-forum-2683") | foreach{
    $_.getElementsByTagName("ul") | foreach{
        $_.getElementsByTagName("li") | Where{$_.className -eq 'bbp-topic-title'} | foreach{
            $_.getElementsByTagName("a") | foreach{
                $_ | Select Title, HREF
            }
        }
    }
}

$myPSObject