j=0
def drive(icontentmer,ifrcontent):
    i=0
    global j
    for line in icontentmer:
        if len(line)<2:
            print "Line:"
            print line
            print "Context:"
            print icontentmer[i-1]
            print "Proponsal:"
            print ifrcontent[j]    
            ans=True
            while ans:
                print ("""
                Enter: Accept Merge
                d. Delete this French
                p. Insert Blank p
                l. Insert Blank li
                i. Ignore/remove empty line in source
                s. Skip this French

                
                9.Exit/Quit
                """)
                ans=raw_input("What would you like to do? ") 
                if ans=="d":
                  del ifrcontent[j]
                  print("\n Record Deleted")
                  break             
                elif ans=="p":
                  icontentmer[i] = '<p contentType="fr">**missing**</p>\n'
                  print icontentmer[i]
                  break
                elif ans=="i":
                  print 'Removing:"',icontentmer[i],'"'
                  del icontentmer[i]
                  break
                elif ans=="l":
                  icontentmer[i] = '<li contentType="fr">**missing**</li>\n'
                  print icontentmer[i]
                  break
                elif ans=="s":
                  j=j+1
                  break
                elif ans=="9":
                  print("\n Goodbye")
                  while x <40:
                    print icontentmer[x]
                    x = x+1
                elif ans=="":
                  print "Accepting Merge"
                  icontentmer[i] = ifrcontent[j]
                  print icontentmer[i]
                  del ifrcontent[0]
                  break
                print i
        elif line =='<object contentType="fr" type="t-fr"></object>\n':
            print "Line:"
            print line
            print "Context:"
            print icontentmer[i-1]
            print "Proponsal:"
            print '<object contentType="fr" type="t-fr">',ifrcontent[j],'</object>'
            ans=True
            while ans:
                print ("""
                Enter: Accept Merge
                d. Delete this French
                i. Ignore/remove empty line in source
                s. Skip this French

                
                9.Exit/Quit
                """)
                ans=raw_input("What would you like to do? ") 
                if ans=="d":
                  del ifrcontent[j]
                  print("\n Record Deleted")
                  break             
                elif ans=="p":
                  icontentmer[i] = '<p contentType="fr">**missing**</p>\n'
                  print icontentmer[i]
                  break
                elif ans=="i":
                  break
                elif ans=="s":
                  j=j+1
                  break
                elif ans=="9":
                  print("\n Goodbye")
                  while x <40:
                    print icontentmer[x]
                    x = x+1
                elif ans=="":
                  print "Accepting Merge"
                  icontentmer[i] = '<object contentType="fr" type="t-fr">',ifrcontent[j],'</object>'
                  print icontentmer[i]
                  del ifrcontent[j]
                  break
                print i
        else:
          print "Nothing to see here."  
        with open(u'merged.xml',"a+") as m:
            m.writelines(icontentmer[i])
        i = i+1  
          


def main():
    with open(u'merged.xml', "w+") as o:
        o.truncate()
    with open(u'PTSuppMerge.xml') as m:
        contentmer = m.readlines()
        print len(contentmer)
    with open(u'Sources/thin.xhtml') as f:
        frcontent = f.readlines()
        print len(frcontent)
    # you may also want to remove whitespace characters like `\n` at the end of each line
    #frcontent = [x.strip() for x in frcontent]
    #contentmer = [x.strip() for x in contentmer]
    while len(frcontent)>2:
        drive(contentmer, frcontent)
        print len(frcontent);

        with open(u'stored.xml',"a+") as m:
            for line in frcontent:
                m.writelines(line)
        


main()

