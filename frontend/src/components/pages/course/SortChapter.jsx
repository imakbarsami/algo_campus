import React, { useEffect } from 'react'
import Modal from 'react-bootstrap/Modal';
import { DragDropContext, Droppable, Draggable } from "@hello-pangea/dnd";
import {apiUrl,token} from '../../common/Config'
import {toast} from 'react-hot-toast'


const SortChapter = ({ showSortChapterModal, handleCloseSortChapterModal,setChapters,course }) => {

    const [chapterData, setChapterData] = React.useState([]);

    const handleDragEnd = (result) => {
        if (!result.destination) return;

        const reorderedItems = Array.from(chapterData);
        const [movedItem] = reorderedItems.splice(result.source.index, 1);
        reorderedItems.splice(result.destination.index, 0, movedItem);

        setChapterData(reorderedItems);
        saveOrder(reorderedItems);
    };

    
    const saveOrder=async(data)=>{
       console.log(data)
       await fetch(`${apiUrl}/sort-chapters`,{
           method:'POST',
           headers:{
               'Content-Type':'application/json',
               'Accept':'application/json',
               'Authorization':`Bearer ${token}`
           },
           body:JSON.stringify({chapters:data})
       }).then(res=>res.json())
       .then(result=>{
           if(result.status==200){
               setChapters({ type: "SET_CHAPTER", payload: result.chapters })
               toast.success(result.message)
           }
       })
    }

    useEffect(()=>{
        if(course){
            setChapterData(course.chapters)
        }
    },[course])


    return (
        <>
            <Modal size='lg' show={showSortChapterModal} onHide={handleCloseSortChapterModal}>
                <Modal.Header closeButton>
                    <Modal.Title>Sort Chapter</Modal.Title>
                </Modal.Header>
                <Modal.Body>
                    <DragDropContext onDragEnd={handleDragEnd} >
                        <Droppable droppableId="list">
                            {(provided) => (
                                <div {...provided.droppableProps} ref={provided.innerRef} className="space-y-2">
                                    {
                                        chapterData.map((chapter, index) => (
                                            <Draggable key={chapter.id} draggableId={`${chapter.id}`} index={index}>

                                                {(provided) => (
                                                    <div
                                                        ref={provided.innerRef}
                                                        {...provided.draggableProps}
                                                        {...provided.dragHandleProps}
                                                        className="mt-2 border px-3 py-2 bg-white shadow-lg  rounded"
                                                    >

                                                        {chapter.title}
                                                    </div>
                                                )}
                                            </Draggable>
                                        ))}
                                    {provided.placeholder}
                                </div>
                            )}
                        </Droppable>
                    </DragDropContext>
                </Modal.Body>
                <Modal.Footer>
                </Modal.Footer>
            </Modal>

        </>
    )
}

export default SortChapter