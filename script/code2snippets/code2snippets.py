def read_file(file):
    with open(file, "r") as f:
        return f.read()


def code2snippets(code):
    snippets = []
    code = code.split("\n")
    for i in range(len(code)):
        snippet = "".join(('"', code[i].replace('"', '"'), '",'))
        snippets.append(snippet)
    return snippets


def print_snippets(snippets):
    for snippet in snippets:
        print(snippet)


if __name__ == "__main__":
    code = read_file("code.txt")
    snippets = code2snippets(code)
    print_snippets(snippets)
