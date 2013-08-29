correct = open("query2.out")

for line in correct:
  row = line.split(":")
  if len(row) == 2 and "system" not in row[0]:
    props = row[0].strip().split()
    cassettes = row[1].strip().split()
    for p in props:
      for c in cassettes:
        print c, p
