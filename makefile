compile:
			for file_path in input/*.md; do \
				FILE_NAME=`basename $$file_path | sed 's/.md//g'`; \
				pandoc --from markdown $$file_path --to pdf --template=styles/template.tex --pdf-engine=xelatex -o $$FILE_NAME.pdf; \
				echo Generated: $$FILE_NAME.pdf; \
				pandoc --from markdown $$file_path --to html  -s -c style.css --toc -o $$FILE_NAME.html; \
				echo "<style>" >> $$FILE_NAME.html; \
				cat styles/style.css >> $$FILE_NAME.html; \
				echo "<style>" >> $$FILE_NAME.html; \
				echo Generated: $$FILE_NAME.html; \
				pandoc --from markdown $$file_path --to docx -o $$FILE_NAME.docx; \
				echo Generated: $$FILE_NAME.docx; \
				pandoc --from markdown $$file_path --to rtf -o $$FILE_NAME.rtf; \
				echo Generated: $$FILE_NAME.rtf; \
				pandoc --from markdown -t dzslides --css styles/dzslides.css --self-contained -s $$file_path --to dzslides -o $$FILE_NAME--presentation.html; \
				echo Generated: $$FILE_NAME--presentation.html; \
				pandoc --from markdown $$file_path --to plain -o $$FILE_NAME.txt; \
				echo Generated: $$FILE_NAME.txt; \
			done