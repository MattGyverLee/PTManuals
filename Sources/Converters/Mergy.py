import os
j=0
def drive(iencontent,ifrcontent):
    i=0
    global j

    for line in iencontent:
        print len(line)
        print line
        if i>60000:
            break
        control=False
        if len(line)<2:
            while control==False:
                ans=True
                print "Line:"
                print line
                print "Context:"
                print iencontent[i-1]
                print "Proponsal:"
                print ifrcontent[j]
                while ans:
                    print ("""
                    Enter: Accept Merge
                    d. Delete this French
                    p. Insert Blank p
                    l. Insert Blank li
                    i. Ignore/remove empty line in source
                    s. Skip this French
                    b. previous French
                    2. write French and return
                    9.Exit/Quit
                    """)
                    ans=raw_input("What would you like to do? ") 
                    if ans=="d":
                      del ifrcontent[j]
                      print("\n Record Deleted")
                      break
                    elif ans=="b":
                      j=j-1
                      break
                    elif ans=="p":
                      iencontent[i] = '<p contentType="fr">**missing**</p>\n'
                      print iencontent[i]
                      with open(u'PT36Biling.xml',"a+") as m:
                          m.write(iencontent[i])
                      #del iencontent[i]
                      control=True
                      break
                    elif ans=="i":
                      print 'Ignoring:"',iencontent[i],'"'
                      #del iencontent[i]
                      control=True
                      break
                    elif ans=="2":
                      print 'Printing:"',ifrcontent[j],'"'
                      with open(u'PT36Biling.xml',"a+") as m:
                          m.write("^^^")
                          m.write(ifrcontent[j])
                      del ifrcontent[j]
                      break
                    elif ans=="l":
                      iencontent[i] = '<li contentType="fr">**missing**</li>\n'
                      with open(u'PT36Biling.xml',"a+") as m:
                          m.write(iencontent[i])
                      #del iencontent[i]
                      control=True
                      break
                    elif ans=="s":
                      j=j+1
                      break
                    elif ans=="9":
                      print("\n Goodbye")
                      with open(u'PT36Biling.xml',"a+") as m:
                          m.writelines(iencontent)
                          break
                    elif ans=="":
                      print "Accepting Merge"
                      
                      IsSame=(iencontent[i-1][:5] == ifrcontent[j][:5])
                      print IsSame
                      if iencontent[i-1][:5] != ifrcontent[j][:5]:
                          with open(u'PT36Biling.xml',"a+") as m:
                              m.write('***')
                      print iencontent[i-1]
                      print ifrcontent[j]
                      iencontent[i] = ifrcontent[j]
                      print "iencontent[i] ",iencontent[i]
                      print "ifrcontent[j] ",ifrcontent[j]
                      del ifrcontent[j]
                      with open(u'PT36Biling.xml',"a+") as m:
                          m.write(iencontent[i])
                      #del iencontent[i]
                      control=True
                      #break
                    print i
        else:
         print "Nothing to see here."  
         with open(u'PT36Biling.xml',"a+") as m:
            m.write(iencontent[i])
        i = i+1  
          


def main():
    with open(u'PT36Biling.xml', "w+") as o:
        o.truncate()
    with open(u'PT36.xml') as m:
        encontent = m.readlines()
        print len(encontent)
    with open(u'PT36FR-filter.xml') as f:
        frcontent = f.readlines()
        print len(frcontent)
    # you may also want to remove whitespace characters like `\n` at the end of each line
#    frcontent = [x.strip() for x in frcontent]
#    encontent = [x.strip() for x in encontent] 
    drive(encontent, frcontent)
    print len(frcontent);
    with open(u'stored.xml',"a+") as m:
        for line in frcontent:
             m.writelines(line)
        


main()

